import 'package:flutter/material.dart';
import 'package:kfc_mini/Allbeer.dart';
// import 'package:kfc_mini/routers.dart';
// import 'package:kfc_mini/themes/style.dart';
// import 'package:flutter_stock/screens/home/home_screen.dart';

// 
void main() async {
  runApp(
    // DevicePreview(
    //   builder: (context) => MyApp(),
    // ),
    MyApp()
    );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
  50: Color.fromRGBO(156, 23, 54, .1),
  100: Color.fromRGBO(156, 23, 54, .2),
  200: Color.fromRGBO(156, 23, 54, .3),
  300: Color.fromRGBO(156, 23, 54, .4),
  400: Color.fromRGBO(156, 23, 54, .5),
  500: Color.fromRGBO(156, 23, 54, .6),
  600: Color.fromRGBO(156, 23, 54, .7),
  700: Color.fromRGBO(156, 23, 54, .8),
  800: Color.fromRGBO(156, 23, 54, .9),
  900: Color.fromRGBO(156, 23, 54, 1),
};
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // locale: DevicePreview.locale(context), // Add the locale here
      // builder: DevicePreview.appBuilder, // Add the builder here
      theme: ThemeData(
          fontFamily: 'Kanit',
          primarySwatch: MaterialColor(0xff9C1736, color),
        ),
      // initialRoute: '/home',
      home: beermain(),
      // routes: routes,
      // home: MyHomePage(),
    );
  }
}