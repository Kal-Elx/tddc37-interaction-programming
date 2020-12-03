// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

/// Returns if widget is on screen.
/// Source: https://stackoverflow.com/questions/56602769/how-to-check-if-widget-is-visible-using-flutterdriver
isPresent(SerializableFinder byValueKey, FlutterDriver driver,
    {Duration timeout = const Duration(seconds: 1)}) async {
  try {
    await driver.waitFor(byValueKey, timeout: timeout);
    return true;
  } catch (exception) {
    return false;
  }
}

void main() {
  final infoScreenTitle = find.byValueKey('infoScreenTitle');
  final dismissButton = find.byValueKey('dismissButton');
  final resetButton = find.byValueKey('resetButton');
  final infoPageView = find.byValueKey('infoPageView');
  final firstInfoCard = find.byValueKey('firstInfoCard');
  final secondInfoCard = find.byValueKey('secondInfoCard');
  final thirdInfoCard = find.byValueKey('thirdInfoCard');

  group('OneTimeInformation', () {
    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Information screen is dismissible', () async {
      // Make sure information screen is open.
      expect(await isPresent(infoScreenTitle, driver), true);

      // Dismiss information.
      await driver.tap(dismissButton);

      // Check that information screen is closed.
      expect(await isPresent(infoScreenTitle, driver), false);

      // Reset that informations has been seen.
      await driver.tap(resetButton);

      // Restart app.
      await driver.requestData('restart');
    });

    test('Information screen is not shown if already seen', () async {
      // Make sure information screen is open.
      expect(await isPresent(infoScreenTitle, driver), true);

      // Dismiss information.
      await driver.tap(dismissButton);

      // Check that information screen is closed.
      expect(await isPresent(infoScreenTitle, driver), false);

      // Restart app.
      await driver.requestData('restart');

      // Check that information screen was not opened.
      expect(await isPresent(infoScreenTitle, driver), false);

      // Reset that informations has been seen.
      await driver.tap(resetButton);

      // Restart app.
      await driver.requestData('restart');
    });

    test('Scroll all cards', () async {
      // Make sure information screen is open.
      expect(await isPresent(infoScreenTitle, driver), true);

      await driver.waitFor(infoPageView);

      // First card is shown.
      expect(await isPresent(firstInfoCard, driver), true);
      expect(await isPresent(secondInfoCard, driver), false);
      expect(await isPresent(thirdInfoCard, driver), false);

      // Swipe left and see second card.
      await driver.scroll(infoPageView, -400, 0, Duration(milliseconds: 200));
      expect(await isPresent(secondInfoCard, driver), true);

      // Swipe left again and see third card.
      await driver.scroll(infoPageView, -400, 0, Duration(milliseconds: 200));
      expect(await isPresent(thirdInfoCard, driver), true);

      // Swipe right and see second card.
      await driver.scroll(infoPageView, 400, 0, Duration(milliseconds: 200));
      expect(await isPresent(secondInfoCard, driver), true);

      // Swipe right again and see first card.
      await driver.scroll(infoPageView, 400, 0, Duration(milliseconds: 200));
      expect(await isPresent(firstInfoCard, driver), true);
    });
  });
}
