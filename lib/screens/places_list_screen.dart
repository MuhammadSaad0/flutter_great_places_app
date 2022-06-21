import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/provider/great_places.dart';
import 'package:provider/provider.dart';
import '../screens/add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your places"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: Center(
          child: Text("No Places yet..."),
        ),
        builder: (ctx, greatPlaces, ch) => greatPlaces.items.length <= 0
            ? ch
            : ListView.builder(
                itemCount: greatPlaces.items.length,
                itemBuilder: (ctx, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(greatPlaces.items[index].image),
                  ),
                  title: Text(greatPlaces.items[index].title),
                  onTap: () {},
                ),
              ),
      ),
    );
  }
}
