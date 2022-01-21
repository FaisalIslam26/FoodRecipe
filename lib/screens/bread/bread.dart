import 'package:flutter/material.dart';
import 'package:foodrecipeapp/data.dart';
import 'package:foodrecipeapp/global/functions.dart';
import 'package:foodrecipeapp/screens/details/details.dart';
import 'package:foodrecipeapp/widget/custom_grid_tile.dart';

class BreadScreen extends StatelessWidget {
  static const path = "BreadScreen";
  final List bread = bdfood["bread"];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: customGridDelegate(),
        padding: EdgeInsets.all(10),
        itemCount: bread.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomGridTile(
            onTap: () {
              Navigator.pushNamed(context, DetailScreen.path,
                  arguments: {"category": "Bread", "data": bread[index]});
            },
            imageUrl: bread[index]["image"],
            title: bread[index]["title"],
          );
        });
  }
}
