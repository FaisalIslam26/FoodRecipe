import 'package:flutter/material.dart';
import 'package:foodrecipeapp/about_us.dart';
import 'package:foodrecipeapp/screens/bread/bread.dart';
import 'package:foodrecipeapp/screens/cooked/cooked.dart';
import 'package:foodrecipeapp/screens/desert/desert.dart';
import 'package:foodrecipeapp/screens/details/details.dart';
import 'package:foodrecipeapp/screens/favorite/favorite.dart';
import 'package:foodrecipeapp/screens/home/home.dart';
import 'package:foodrecipeapp/screens/non_veg/non_veg.dart';
import 'package:foodrecipeapp/screens/rice/rice.dart';
import 'package:foodrecipeapp/screens/tips/tips.dart';
import 'package:foodrecipeapp/screens/video/video_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Demo",
        theme: ThemeData(
          primarySwatch: Colors.red,
          dividerTheme: DividerThemeData(
            space: 20,
            // thickness: 5,
            // color: Colors.green,
            indent: 20,
            endIndent: 20,
          ),
        ),
        initialRoute: HomeScreen.path,
        routes: {
          HomeScreen.path: (ctx) => HomeScreen(),
          RiceScreen.path: (ctx) => RiceScreen(),
          BreadScreen.path: (ctx) => BreadScreen(),
          DessertScreen.path: (ctx) => DessertScreen(),
          NonVegScreen.path: (ctx) => NonVegScreen(),
          DetailScreen.path: (ctx) => DetailScreen(),
          FavoriteScreen.path: (ctx) => FavoriteScreen(),
          VideoScreen.path: (ctx) => VideoScreen(),
          CookedScreen.path: (ctx) => CookedScreen(),
          CookingTips.path: (ctx) => CookingTips(),
          AboutUs.path: (ctx) => AboutUs(),
        }
        // home: DetailScreen(),
        );
  }
}
