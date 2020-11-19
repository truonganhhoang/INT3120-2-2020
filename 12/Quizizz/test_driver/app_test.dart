import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("Test choose answer", () {
    final choice1 = find.byValueKey("Choice");
    final choose = find.byValueKey("Choose");
    FlutterDriver driver;
    // connect to the Flutter driver before  running anything
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test("choose ans", () async {
      await driver.tap(choice1);
      await driver.waitFor(choose);
    });
  });

  group("Test pause game", () async {
    final pauseButton = find.byValueKey("pauseButton");
    final pauseScr = find.byValueKey("pauseScr");

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test("end quiz", () async {
      await driver.tap(pauseButton);
      await driver.waitFor(pauseScr);
    });
  });
}
