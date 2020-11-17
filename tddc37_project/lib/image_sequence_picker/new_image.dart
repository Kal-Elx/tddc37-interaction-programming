import 'package:flutter/material.dart';

/// Unmovable list item for adding a new image.
class NewImage extends StatelessWidget {
  final key = UniqueKey();
  final void Function() newGalleryImage;
  final void Function() newCameraImage;
  final double borderRadius;
  final double padding;
  final double aspectRatio;

  NewImage({
    @required this.newGalleryImage,
    @required this.newCameraImage,
    @required this.borderRadius,
    @required this.padding,
    @required this.aspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {}, // Override onLongPress to make item unmovable.
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Center(
              child: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (ctx) {
                      return Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FlatButton.icon(
                              label: Text("Camera"),
                              icon: Icon(Icons.camera_alt),
                              onPressed: () {
                                newCameraImage();
                                Navigator.of(context).pop();
                              },
                            ),
                            FlatButton.icon(
                              label: Text("Gallery"),
                              icon: Icon(Icons.photo),
                              onPressed: () {
                                newGalleryImage();
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
