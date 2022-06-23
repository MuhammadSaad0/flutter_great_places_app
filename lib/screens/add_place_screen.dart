import 'dart:io';
import "package:flutter/material.dart";
import '../widgets/image_input.dart';
import '../widgets/location_input.dart';
import 'package:provider/provider.dart';
import '../provider/great_places.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = "/add-places-screen";

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add A New Place")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Title",
                    ),
                    controller: _titleController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ImageInput(_selectImage),
                  SizedBox(
                    height: 20,
                  ),
                  LocationInput(),
                ],
              ),
            ),
          )),
          ElevatedButton.icon(
            onPressed: _savePlace,
            icon: Icon(Icons.add),
            label: Text("Add Place"),
            style: ElevatedButton.styleFrom(
                elevation: 0, tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          )
        ],
      ),
    );
  }
}
