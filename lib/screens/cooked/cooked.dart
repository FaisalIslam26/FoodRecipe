import 'package:flutter/material.dart';
import 'package:foodrecipeapp/database_helper.dart';
import 'package:foodrecipeapp/recipe_model.dart';

class CookedScreen extends StatefulWidget {
  static const String path = "CookedScreen";
  const CookedScreen({Key? key}) : super(key: key);

  @override
  State<CookedScreen> createState() => _CookedScreenState();
}

class _CookedScreenState extends State<CookedScreen> {
  countIngradients(ingradients) {
    var _ingradients =
        ingradients.toString().replaceAll("[", "").replaceAll("]", "");
    var splitIngradients = _ingradients.split(",");
    return splitIngradients.length;
  }

  countDirections(directions) {
    var _directions =
        directions.toString().replaceAll("[", "").replaceAll("]", "");
    var splitDirections = _directions.split(",");
    return splitDirections.length;
  }

  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cooked"),
      ),
      body: Container(
        height: 400,
        child: FutureBuilder(
          future: DatabaseHelper.instance.getCookedRecipe(),
          builder: (BuildContext context,
              AsyncSnapshot<List<RecipeModel>> snapshot) {
            if (!snapshot.hasData) {
              return Text("Loading......");
            }
            return isloading
                ? CircularProgressIndicator()
                : ListView(
                    children: snapshot.data!.map((cooked) {
                      return Card(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              cooked.image!,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${cooked.title}",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Ingredients:  ${countIngradients(cooked.ingredients)}",
                                        // "Ingradients",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "Directions:  ${countDirections(cooked.directions)}",
                                        // "Directions",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isloading = true;
                                });
                                DatabaseHelper.instance
                                    .deleteCookedItem(cooked.id);
                                setState(() {
                                  isloading = false;
                                });
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  );
          },
        ),
      ),
    );
  }
}
