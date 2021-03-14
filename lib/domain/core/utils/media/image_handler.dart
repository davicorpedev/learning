import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageHandler {
  late final ImagePicker picker;

  ImageHandler({required this.picker});

  Future<File?> showPickerDialog(BuildContext context) async {
    return await showDialog(
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
                final pickedFile = await picker.getImage(
                    source: ImageSource.camera,
                    maxHeight: 1024,
                    maxWidth: 1024);

                if (pickedFile != null) {
                  Navigator.pop(context, File(pickedFile.path));
                }
              },
            ),
            ListTile(
              title: Text("Gallery"),
              leading: Icon(Icons.photo_outlined),
              onTap: () async {
                final pickedFile = await picker.getImage(
                    source: ImageSource.gallery,
                    maxHeight: 1024,
                    maxWidth: 1024);

                if (pickedFile != null) {
                  Navigator.pop(context, File(pickedFile.path));
                }
              },
            ),
          ],
        );
      },
    );
  }
}
