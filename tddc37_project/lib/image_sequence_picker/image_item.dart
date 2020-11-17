import 'dart:io';

import 'package:flutter/material.dart';

import 'remove_image_dialog.dart';

/// List item with image.
class ImageItem extends StatelessWidget {
  final key = UniqueKey(); // All items in the list needs a key.
  final File image;
  final void Function() removePicture;
  final double borderRadius;
  final double padding;
  final double aspectRatio;

  ImageItem({
    @required this.image,
    @required this.removePicture,
    @required this.borderRadius,
    @required this.padding,
    @required this.aspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
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
        ),
      ),
    );
  }
}
