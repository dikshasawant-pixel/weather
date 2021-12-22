import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Flutter Weather App test', () {
    FlutterDriver? driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() {
      driver?.close();
    });

    var textField = find.byValueKey("TextField");
    var tempInfo = find.byValueKey("Temperature");
    var button = find.byValueKey("");

    test("get temperature ", () async {
      await driver?.tap(find.byValueKey(textField));
      await driver?.clearTimeline();
      await Future.delayed(const Duration(seconds: 2));
      await driver?.enterText("Mumbai");
      await driver?.waitForAbsent(tempInfo);
      await driver?.tap(find.byValueKey(button));
      await driver?.waitFor(tempInfo);
      await driver?.waitUntilNoTransientCallbacks();
      // ignore: unnecessary_null_comparison
      assert(tempInfo != null);
    });
  });
}
