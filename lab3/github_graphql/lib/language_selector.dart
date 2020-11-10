import 'package:flutter/material.dart';

class LanguageSelector extends StatelessWidget {
  final void Function(String) setLanguage;

  static const languages = [
    'Top overall',
    'JavaScript',
    'Python',
    'Java',
    'PHP',
    'C#',
    'C++',
    'TypeScript',
    'Shell',
    'C',
    'Ruby',
  ];

  const LanguageSelector(this.setLanguage);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.ac_unit),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext ctx) {
            return Container(
              height: 200,
              child: Center(
                child: ListView.builder(
                  itemCount: languages.length,
                  itemBuilder: (_, i) => FlatButton(
                    onPressed: () {
                      setLanguage(languages[i]);
                      Navigator.of(context).pop();
                    },
                    child: Text(languages[i]),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
