import 'dart:math';

import 'package:flutter/material.dart';
import 'package:foodrecipeapp/database_helper.dart';
import 'package:foodrecipeapp/recipe_model.dart';
import 'package:foodrecipeapp/screens/cooked/cooked.dart';
import 'package:foodrecipeapp/screens/favorite/favorite.dart';
import 'package:foodrecipeapp/screens/video/video_screen.dart';

import 'package:foodrecipeapp/widget/custom_button.dart';
import 'package:share/share.dart';

class DetailScreen extends StatelessWidget {
  static const String path = "DetailScreen";

  void _onshare(BuildContext context, text, subject) async {
    if (subject.isNotEmpty) {
      await Share.share(
        "$text",
        subject: "$subject",
      );
    } else {
      await Share.share(
        "Dummy text",
        subject: "Dummy Subject",
      );
    }
  }

  Random random = Random();

  String getShareData(title, ingredients, directions) {
    var _ingredients =
        ingredients.toString().replaceAll("[", "").replaceAll("]", "");
    var _directions =
        directions.toString().replaceAll("[", "").replaceAll("]", "");
    return '''

    $title 
    Ingredients: ${_ingredients.toString()}
    Directions: ${_directions.toString()};
        ''';
  }

  @override
  Widget build(BuildContext context) {
    // final Map bdfood = ModalRoute.of(context)!.settings.arguments as Map;
    final double size = MediaQuery.of(context).size.width;
    final Map items = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Details",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "Category: ${items["category"]}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              _onshare(
                context,
                getShareData(
                  items["data"]["title"],
                  items["data"]["ingredients"],
                  items["data"]["directions"],
                ),
                "Feel free share this recipe",
              );
            },
            icon: Icon(Icons.share),
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              height: 200,
              color: Colors.orange,
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Image.asset(
                    // bdfood['image'],
                    items['data']['image'],
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      // alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10),
                      width: size,
                      height: 56,
                      color: Colors.black.withOpacity(0.5),
                      // child: Text(
                      //   bdfood['title'],
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 24,
                      //     fontWeight: FontWeight.w700,
                      //   ),
                      // ),

                      child: Center(
                        child: Text(
                          items['data']['title'],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  )
                ],
              )),
          Row(
            children: [
              CustomButton(
                ontap: () async {
                  final recipeModel = RecipeModel(
                      id: random.nextInt(100),
                      title: items["data"]["title"],
                      image: items["data"]["image"],
                      ingredients: items["data"]["directions"].toString(),
                      directions: items["data"]["directions"].toString(),
                      youtubeUrl: items["data"]["youtubeUrl"]);
                  await DatabaseHelper.instance.addCookedRecipe(recipeModel);

                  Navigator.pushNamed(context, CookedScreen.path,
                      arguments: items["data"]);
                },
                icon: Icons.check_outlined,
                lebel: "Cooked",
                color: Colors.orange,
              ),
              CustomButton(
                ontap: () async {
                  final recipeModel = RecipeModel(
                      id: random.nextInt(100),
                      title: items["data"]["title"],
                      image: items["data"]["image"],
                      ingredients: items["data"]["directions"].toString(),
                      directions: items["data"]["directions"].toString(),
                      youtubeUrl: items["data"]["youtubeUrl"]);

                  await DatabaseHelper.instance.addFavouriteRecipe(recipeModel);

                  Navigator.pushNamed(context, FavoriteScreen.path,
                      arguments: items["data"]);
                },
                icon: Icons.favorite,
                lebel: "Favorite",
                color: Colors.pink,
              ),
              CustomButton(
                ontap: () {
                  Navigator.pushNamed(context, VideoScreen.path,
                      arguments: items["data"]);
                },
                icon: Icons.video_camera_back,
                lebel: "Videos",
                color: Colors.red,
              ),
            ],
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(15),
                color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      color: Colors.teal.shade700,
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ingredients",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                            Divider(),
                            for (int i = 0;
                                i < items["data"]['ingredients'].length;
                                i++)
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 8,
                                    height: 8,
                                    margin: EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4)),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Text(
                                      items['data']['ingredients'][i],
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      color: Colors.teal.shade700,
                      elevation: 10,
                      child: Column(
                        children: [
                          Text(
                            "Direction",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Divider(),
                          for (int i = 0;
                              i < items['data']['directions'].length;
                              i++)
                            Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  margin: EdgeInsets.only(top: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Text(
                                      items['data']['directions'][i],
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
