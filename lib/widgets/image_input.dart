import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;
  ImageInput(this.onSelectImage);
  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  Future getImage(BuildContext ctx) async {
    var image = await ImagePickerGC.pickImage(
        imageQuality: 100,
        maxWidth: double.infinity,
        context: ctx,
        source: ImgSource.Camera);
    setState(() {
      _storedImage = File(image.path);
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(image.path);
    final _savedImage = await _storedImage.copy("${appDir.path}/$fileName");
    widget.onSelectImage(_savedImage);
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
            onPressed: () {
              getImage(context);
            },
            icon: Icon(Icons.camera),
            label: Text("Take Picture")),
      ],
    );
  }
}
