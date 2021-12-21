import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Flutter Weather App test', () {
    FlutterDriver? driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() {
      if (driver != null) {
        driver?.close();
      }
    });

    var textField = find.byType("TextField");
    var tempInfo = find.byType("Temperature");
    var button = find.byType("");

    test("get temperature ", () async {
      await driver?.tap(textField);
      await driver?.clearTimeline();
      await Future.delayed(Duration(seconds: 2));
      await driver?.enterText("Mumbai");
      await driver?.waitForAbsent(tempInfo);
      await driver?.tap(button);
      await driver?.waitFor(tempInfo);
      await driver?.waitUntilNoTransientCallbacks();
      // ignore: unnecessary_null_comparison
      assert(tempInfo != null);
    });
  });
}
