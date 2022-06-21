import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';

class ImageInput extends StatefulWidget {
  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;
  Future getImage() async {
    var image = await ImagePickerGC.pickImage(
        imageQuality: 100,
        maxWidth: double.infinity,
        context: context,
        source: ImgSource.Camera);
    setState(() {
      _storedImage = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Container(
            child: _storedImage != null
                ? FittedBox(
                    fit: BoxFit.fill,
                    child: Image.file(
                      _storedImage,
                    ),
                  )
                : Text(
                    "No Image Taken",
                    textAlign: TextAlign.center,
                  ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3.5,
            decoration:
                BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        TextButton.icon(
            onPressed: getImage,
            icon: Icon(Icons.camera),
            label: Text("Take Picture")),
      ],
    );
  }
}
