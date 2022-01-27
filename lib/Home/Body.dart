import 'package:flutter/material.dart';
import 'package:norbertaberor/Home/About-norbertaberor/about-norbertaberor.dart';
import 'package:norbertaberor/Home/CustomBottomClipper/CustomBottomClipper.dart';
import 'package:norbertaberor/Home/TechStack/TechStack.dart';
import 'package:norbertaberor/Home/Top-carousel/carousel.dart';
import 'package:norbertaberor/Home/Top-carousel/curvey.dart';
import 'package:norbertaberor/Home/Top-carousel/menu_more.dart';
import 'package:norbertaberor/Home/UIChallenges/UIChallenges.dart';
import 'package:norbertaberor/Home/works/works.dart';


class Body extends StatefulWidget {
  final ValueChanged<bool> myThemeMode;

  const Body({Key key, this.myThemeMode}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool showPopOver = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (__){
          __.disallowGlow();      
      return false;
      },
      child:
      ListView(
        children: [
          HomeCarousel(
            isBright: (themeMode){
                widget.myThemeMode?.call(themeMode);
            },
          ),
          

          SizedBox(height: 200.0,),
          AboutNorbertAberor(),
          SizedBox(height: 60.0,),
          Works(),
          SizedBox(height: 60.0,),
          TechStack(),  
          SizedBox(height: 60.0,),
          UIChallenges(), 
          CustomBottomClipper(),  
            
        ],
      ),
      ),
    );
  }
}