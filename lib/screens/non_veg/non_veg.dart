import 'package:flutter/material.dart';
import 'package:foodrecipeapp/data.dart';
import 'package:foodrecipeapp/global/functions.dart';
import 'package:foodrecipeapp/screens/details/details.dart';
import 'package:foodrecipeapp/widget/custom_grid_tile.dart';

class NonVegScreen extends StatelessWidget {
  static const String path = "NonVegScreen";
  final List nonveg = bdfood["non_veg"];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: customGridDelegate(),
        padding: EdgeInsets.all(10),
        itemCount: nonveg.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomGridTile(
            onTap: () {
              Navigator.pushNamed(context, DetailScreen.path,
                  arguments: {"category": "Non-Veg", "data": nonveg[index]});
            },
            imageUrl: nonveg[index]["image"],
            title: nonveg[index]["title"],
          );
        });
  }
}
