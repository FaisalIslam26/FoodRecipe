import 'package:flutter/material.dart';
import 'package:foodrecipeapp/data.dart';
import 'package:foodrecipeapp/global/functions.dart';
import 'package:foodrecipeapp/screens/details/details.dart';
import 'package:foodrecipeapp/widget/custom_grid_tile.dart';

class DessertScreen extends StatelessWidget {
  static const String path = "DessertScreen";
  final List dessert = bdfood['dessert'];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: customGridDelegate(),
        padding: EdgeInsets.all(10),
        itemCount: dessert.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomGridTile(
            onTap: () {
              Navigator.pushNamed(context, DetailScreen.path,
                  arguments: {"category": "Dessert", "data": dessert[index]});
            },
            imageUrl: dessert[index]["image"],
            title: dessert[index]["title"],
          );
        });
  }
}
