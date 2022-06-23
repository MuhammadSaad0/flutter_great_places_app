import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/great_places.dart';
import "../helpers/location_helper.dart";

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({Key key}) : super(key: key);
  static const routeName = "/details-screen";

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final selectedPlace =
        Provider.of<GreatPlaces>(context, listen: false).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPlace.title),
      ),
      body: Column(children: [
        Container(
          height: 250,
          width: double.infinity,
          child: Image.file(
            selectedPlace.image,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          height: 300,
          width: double.infinity,
          child: Image.network(
            LocationHelper.generatePreview(
                latitude: selectedPlace.location.latitude,
                longitude: selectedPlace.location.longitude),
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Location",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}
