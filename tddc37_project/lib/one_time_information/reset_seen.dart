import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetSeen extends StatelessWidget {
  /// Reset that the user has seen the information screen before.
  Future<void> _resetSeenInfoBefore() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenInfoBefore', false);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.refresh),
      onPressed: _resetSeenInfoBefore,
    );
  }
}
