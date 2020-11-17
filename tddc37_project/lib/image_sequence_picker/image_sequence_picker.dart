import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'image_item.dart';
import 'new_image.dart';

/// Widget for selecting a sequence of images.
class ImageSequencePicker extends StatelessWidget {
  final _key = new GlobalKey<_ImageSequencePickerStateImpl>();
  final double borderRadius;
  final double padding;
  final double aspectRatio;
  final Axis axis;

  ImageSequencePicker({
    this.borderRadius = 0.0,
    this.padding = 0.0,
    this.aspectRatio = 1.0,
    this.axis = Axis.horizontal,
  });

  get images => _key.currentState.images;

  @override
  Widget build(BuildContext context) {
    return _ImageSequencePickerImpl(
      key: _key,
      borderRadius: borderRadius,
      padding: padding,
      aspectRatio: aspectRatio,
      axis: axis,
    );
  }
}

/// Implementation of ImageSequencePicker.
/// Seperated to be able to access its state with the given key.
class _ImageSequencePickerImpl extends StatefulWidget {
  final double borderRadius;
  final double padding;
  final double aspectRatio;
  final Axis axis;

  _ImageSequencePickerImpl({
    @required Key key,
    @required this.borderRadius,
    @required this.padding,
    @required this.aspectRatio,
    @required this.axis,
  }) : super(key: key);

  @override
  _ImageSequencePickerStateImpl createState() =>
      _ImageSequencePickerStateImpl();
}

class _ImageSequencePickerStateImpl extends State<_ImageSequencePickerImpl> {
  List<File> images = [];
  final picker = ImagePicker();

  /// Updates the state to reflect the list after a reorder.
  void _reorderImages(oldIndex, newIndex) {
    // If moved after new image item place last in list.
    newIndex = min<int>(newIndex, images.length);

    setState(() {
      File old = images[oldIndex];
      if (oldIndex > newIndex) {
        for (int i = oldIndex; i > newIndex; i--) {
          images[i] = images[i - 1];
        }
        images[newIndex] = old;
      } else {
        for (int i = oldIndex; i < newIndex - 1; i++) {
          images[i] = images[i + 1];
        }
        images[newIndex - 1] = old;
      }
    });
  }

  Future<void> _takePicture(ImageSource method) async {
    final imageFile = await picker.getImage(
      source: method,
      maxHeight: 1600,
      maxWidth: 1200,
    );

    if (imageFile != null) {
      // imageFile can be null when the user for example cancels.
      setState(() {
        images.add(File(imageFile.path));
      });
    }
  }

  void _removePicture(File image) {
    setState(() {
      images.remove(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];

    // Create image items for each image.
    items.addAll(images
        .map(
          (image) => ImageItem(
            image: image,
            removePicture: () {
              _removePicture(image);
            },
            borderRadius: widget.borderRadius,
            padding: widget.padding,
            aspectRatio: widget.aspectRatio,
          ),
        )
        .toList());

    // Add a new image item at the back of the list.
    items.add(NewImage(
      newCameraImage: () => _takePicture(ImageSource.camera),
      newGalleryImage: () => _takePicture(ImageSource.gallery),
      borderRadius: widget.borderRadius,
      padding: widget.padding,
      aspectRatio: widget.aspectRatio,
    ));

    return ReorderableListView(
      children: items,
      onReorder: _reorderImages,
      scrollDirection: widget.axis,
    );
  }
}
