import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VideoHandler {
  late final ImagePicker picker;

  VideoHandler({required this.picker});

  Future<File?> showPickerDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.all(0),
          titlePadding: EdgeInsets.all(16),
          title: Text("Choose a video"),
          children: <Widget>[
            Divider(height: 1, color: Colors.black),
            ListTile(
              title: Text("Camera"),
              leading: Icon(Icons.camera_alt_outlined),
              onTap: () async {
                final pickedFile =
                    await picker.getVideo(source: ImageSource.camera);

                if (pickedFile != null) {
                  Navigator.pop(context, File(pickedFile.path));
                }
              },
            ),
            ListTile(
              title: Text("Gallery"),
              leading: Icon(Icons.photo_outlined),
              onTap: () async {
                final pickedFile =
                    await picker.getVideo(source: ImageSource.gallery);

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
