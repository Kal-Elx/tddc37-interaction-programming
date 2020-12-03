import 'package:flutter_driver/driver_extension.dart';
import 'package:tddc37_project/main.dart' as app;

void main() {
  // This line enables the extension.
  enableFlutterDriverExtension(handler: (command) async {
    switch (command) {
      case 'restart':
        app.main();
        return 'ok';
    }
    throw Exception('Unknown command');
  });

  // Call the `main()` function of the app, or call `runApp` with
  // any widget you are interested in testing.
  app.main();
}
