import 'package:flutter/material.dart';
import 'package:foodrecipeapp/data.dart';
import 'package:foodrecipeapp/global/functions.dart';
import 'package:foodrecipeapp/screens/details/details.dart';
import 'package:foodrecipeapp/widget/custom_grid_tile.dart';

class FastFoodScreen extends StatelessWidget {
  static const String path = "FastFoodScreen";
  final List fastfood = bdfood["fast_food"];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: customGridDelegate(),
        padding: EdgeInsets.all(10),
        itemCount: fastfood.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomGridTile(
            onTap: () {
              Navigator.pushNamed(context, DetailScreen.path, arguments: {
                "category": "Fast_Food",
                "data": fastfood[index]
              });
            },
            imageUrl: fastfood[index]["image"],
            title: fastfood[index]["title"],
          );
        });
  }
}
