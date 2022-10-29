// ignore_for_file: avoid_print, must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class ImageInput extends StatefulWidget {
  Function onSelectImage;
  ImageInput(this.onSelectImage, {super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  Future<void> _takePicture() async {
    try {
      final picker = ImagePicker();
      final imageFile = await picker.pickImage(
        source: ImageSource.camera,
        maxHeight: 600,
        maxWidth: 600,
      );
      setState(() {
        _storedImage = File(imageFile!.path);
      });
      final appDir = await syspath.getApplicationDocumentsDirectory();
      final fileName = path.basename(imageFile!.path);
      final savedImage =
          await File(imageFile.path).copy('${appDir.path}/$fileName');
      widget.onSelectImage(savedImage);
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Text(
                  'No Image Taken!',
                  textAlign: TextAlign.center,
                ),
        ),
        FittedBox(
          child: TextButton.icon(
            onPressed: _takePicture,
            icon: const Icon(Icons.camera_alt),
            label: const Text('Take Picture'),
          ),
        )
      ],
    );
  }
}
