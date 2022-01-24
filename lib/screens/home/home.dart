import 'package:flutter/material.dart';
import 'package:foodrecipeapp/about_us.dart';
import 'package:foodrecipeapp/constant/constant.dart';
import 'package:foodrecipeapp/global/functions.dart';
import 'package:foodrecipeapp/screens/bread/bread.dart';
import 'package:foodrecipeapp/screens/cooked/cooked.dart';
import 'package:foodrecipeapp/screens/desert/desert.dart';
import 'package:foodrecipeapp/screens/fast_food/fast_food.dart';
import 'package:foodrecipeapp/screens/favorite/favorite.dart';
import 'package:foodrecipeapp/screens/non_veg/non_veg.dart';
import 'package:foodrecipeapp/screens/rice/rice.dart';
import 'package:foodrecipeapp/screens/tips/tips.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  static const String path = "Homescreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            title: Text("BD FOOD RECIPE"),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, FavoriteScreen.path);
                  },
                  icon: Icon(Icons.favorite))
            ],
          ),
          drawer: SafeArea(
            child: Drawer(
              backgroundColor: Colors.grey[850],
              child: Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.grey[850],
                    child: Column(
                      children: [
                        Image.asset("assets/images/food2.jpg"),
                        ListTile(
                          onTap: () {},
                          // leading: Icon(Icons.person_rounded),
                          title: Text(
                            "All Recipes",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          // leading: Icon(Icons.person_rounded),
                          title: Text(
                            "My Recipes",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pushNamed(context, FavoriteScreen.path);
                          },
                          title: Text(
                            "Favorite",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pushNamed(context, CookedScreen.path);
                          },
                          title: Text(
                            "Cooked",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pushNamed(context, CookingTips.path);
                          },
                          // leading: Icon(Icons.person_rounded),
                          title: Text(
                            "Tips",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "More",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          color: Colors.grey,
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Search Recipe",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            launchURL(appLink);
                          },
                          leading: Icon(
                            Icons.thumb_up,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Rate us",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            launchURL(appLink);
                          },
                          leading: Icon(
                            Icons.sync,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Update",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pushNamed(context, AboutUs.path);
                          },
                          leading: Icon(
                            Icons.people,
                            color: Colors.white,
                          ),
                          title: Text(
                            "About Us",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: Column(children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TabBar(
                isScrollable: true,
                unselectedLabelColor: Colors.redAccent,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.redAccent, Colors.orangeAccent]),
                    // borderRadius: BorderRadius.circular(50),
                    color: Colors.redAccent),
                tabs: [
                  Tab(
                    child: Text("Rice"),
                  ),
                  Tab(
                    child: Text("Bread"),
                  ),
                  Tab(
                    child: Text("Desert"),
                  ),
                  Tab(
                    child: Text("Fast-Food"),
                  ),
                  Tab(
                    child: Text("Non-Veg"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                RiceScreen(),
                BreadScreen(),
                DessertScreen(),
                FastFoodScreen(),
                NonVegScreen(),
              ]),
            ),
          ])),
    );
  }
}
