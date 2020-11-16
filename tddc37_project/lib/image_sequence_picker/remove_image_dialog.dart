import 'package:flutter/material.dart';

class RemoveImageDialog extends StatefulWidget {
  final void Function() onRemove;

  RemoveImageDialog({@required this.onRemove});

  @override
  _RemoveImageDialogState createState() => _RemoveImageDialogState();
}

class _RemoveImageDialogState extends State<RemoveImageDialog> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return show
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: widget.onRemove,
                child: Text('Remove'),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    show = false;
                  });
                },
                child: Text('Cancel'),
              ),
            ],
          )
        : GestureDetector(
            onTap: () {
              setState(() {
                show = true;
              });
            },
          );
  }
}
