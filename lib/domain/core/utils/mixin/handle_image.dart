import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

mixin HandleImage {
  Future<File?> imagePickerDialog(BuildContext context) async {
    File? _image;
    final _picker = ImagePicker();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.all(0),
          titlePadding: EdgeInsets.all(16),
          title: Text("Choose an image"),
          children: <Widget>[
            Divider(height: 1, color: Colors.black),
            ListTile(
              title: Text("Camera"),
              leading: Icon(Icons.camera_alt_outlined),
              onTap: () async {
                final pickedFile = await _picker.getImage(
                    source: ImageSource.camera,
                    maxHeight: 1024,
                    maxWidth: 1024);

                if (pickedFile != null) _image = File(pickedFile.path);

                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Gallery"),
              leading: Icon(Icons.photo_outlined),
              onTap: () async {
                final pickedFile = await _picker.getImage(
                    source: ImageSource.gallery,
                    maxHeight: 1024,
                    maxWidth: 1024);

                if (pickedFile != null) _image = File(pickedFile.path);

                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );

    return _image;
  }
}
