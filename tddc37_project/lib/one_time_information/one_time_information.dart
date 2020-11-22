import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'information_screen.dart';

/// Handles the transition from InformationScreen to next screen.
class OneTimeInformation extends StatefulWidget {
  final Widget nextScreen;
  final List<Widget> information;
  final String title;
  final String dismissText;

  OneTimeInformation({
    @required this.nextScreen,
    @required this.information,
    @required this.title,
    @required this.dismissText,
  });

  @override
  _OneTimeInformationState createState() => _OneTimeInformationState();
}

class _OneTimeInformationState extends State<OneTimeInformation> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  /// Checks if user has seen the information screen before.
  Future<bool> _getSeenInfoBefore() async {
    final SharedPreferences prefs = await _prefs;
    return (prefs.getBool('seenInfoBefore') ?? false);
  }

  /// Saves if the user has seen the information screen before.
  Future<void> _setSeenInfoBefore({bool seenBefore = true}) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool('seenInfoBefore', seenBefore);
    setState(() {}); //* Rebuild the widget to transition to next screen.
  }

  /// Transitions to next screen.
  void _handleTransition() {
    _setSeenInfoBefore();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _getSeenInfoBefore(),
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          var seenInfoBefore = snapshot.data;
          return seenInfoBefore
              ? widget.nextScreen
              : InformationScreen(
                  onClose: _handleTransition,
                  information: widget.information,
                  title: widget.title,
                  dismissText: widget.dismissText,
                );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
