import 'dart:io';

import 'package:flutter/material.dart';

import 'remove_image_dialog.dart';

/// List item with image.
class ImageItem extends StatelessWidget {
  final key = UniqueKey(); // All items in the list needs a key.
  final File image;
  final void Function() removePicture;

  ImageItem({
    @required this.image,
    @required this.removePicture,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: RemoveImageDialog(
          onRemove: removePicture,
        ),
      ),
    );
  }
}
