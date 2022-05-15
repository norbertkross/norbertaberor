import 'package:flutter/material.dart';
import 'package:norbertaberor/Home/Body.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  // Here we set the URL strategy for our web app.
  // It is safe to call this function when running on mobile or desktop as well.
  setPathUrlStrategy();  
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


// class MyApp extends StatelessWidget {

  // static Map<int, Color> color = {
  // 50: Color.fromRGBO(30,110,250, .1), // 30,110,250,
  // 100: Color.fromRGBO(30,110,250, .2),
  // 200: Color.fromRGBO(30,110,250, .3),
  // 300: Color.fromRGBO(30,110,250, .4),
  // 400: Color.fromRGBO(30,110,250, .5),
  // 500: Color.fromRGBO(30,110,250, .6),
  // 600: Color.fromRGBO(30,110,250, .7),
  // 700: Color.fromRGBO(30,110,250, .8),
  // 800: Color.fromRGBO(30,110,250, .9),
  // 900: Color.fromRGBO(30,110,250, 1),
  // };

  static Map<int, Color> color = {
  50: Color.fromRGBO(26, 79, 247, .1), // 30,110,250,
  100: Color.fromRGBO(26, 79, 247, .2),
  200: Color.fromRGBO(26, 79, 247, .3),
  300: Color.fromRGBO(26, 79, 247, .4),
  400: Color.fromRGBO(26, 79, 247, .5),
  500: Color.fromRGBO(26, 79, 247, .6),
  600: Color.fromRGBO(26, 79, 247, .7),
  700: Color.fromRGBO(26, 79, 247, .8),
  800: Color.fromRGBO(26, 79, 247, .9),
  900: Color.fromRGBO(26, 79, 247, 1),
  };

//final MaterialColor customColor = MaterialColor(0xFF1E6EFA, color);  
final MaterialColor customColor = MaterialColor(0xFF1a4ff7, color);  

bool themeIsDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      themeMode:ThemeMode.dark,
      darkTheme: ThemeData(
        //brightness:Brightness.dark,
        brightness:themeIsDark == true? Brightness.dark : Brightness.light,
        ),
      
      debugShowCheckedModeBanner: false,
      title: 'norbertaberor',
      theme: ThemeData(
        primarySwatch: customColor,
        scaffoldBackgroundColor: const Color(0xffFFFFFF),
        // primaryColor: Color(0xFF1a4ff7),
        // primaryColorDark: Color(0xFF1a4ff7),
      ),
      home: Body(
        myThemeMode: (themeMode){
            setState(() {
              themeIsDark = themeMode;              
            });
        },
      ),
    );
  }
}

