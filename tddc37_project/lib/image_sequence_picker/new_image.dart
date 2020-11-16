import 'package:flutter/material.dart';

/// Unmovable list item for adding a new image.
class NewImage extends StatelessWidget {
  final key = UniqueKey();
  final void Function() newGalleryImage;
  final void Function() newCameraImage;

  NewImage({
    @required this.newGalleryImage,
    @required this.newCameraImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {}, // Override onLongPress to make item unmovable.
      child: AspectRatio(
        aspectRatio: 3 / 4,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(8.0),
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
                          IconButton(
                            icon: Icon(Icons.camera_alt),
                            onPressed: () {
                              newCameraImage();
                              Navigator.of(context).pop();
                            },
                          ),
                          IconButton(
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
    );
  }
}
