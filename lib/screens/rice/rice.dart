import 'package:flutter/material.dart';
import 'package:foodrecipeapp/data.dart';
import 'package:foodrecipeapp/global/functions.dart';
import 'package:foodrecipeapp/screens/details/details.dart';
import 'package:foodrecipeapp/widget/custom_grid_tile.dart';

class RiceScreen extends StatelessWidget {
  static const String path = "RiceScreen";
  final List rice = bdfood["rice"];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: customGridDelegate(),
        padding: EdgeInsets.all(10),
        itemCount: rice.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomGridTile(
            onTap: () {
              Navigator.pushNamed(context, DetailScreen.path,
                  arguments: {"category": "Rice", "data": rice[index]});
            },
            imageUrl: rice[index]["image"],
            title: rice[index]["title"],
          );
        });
  }
}
