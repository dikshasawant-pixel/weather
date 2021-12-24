import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:weather/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Testing weather:', () {
    testWidgets('New city weather', (WidgetTester tester) async {
      final String newCity = 'New weather created by test';

      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.text("City"), findsOneWidget);

      await tester.enterText(find.byType(TextField), newCity);
    });
  });
}
