import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:html' as html;

class TechStack extends StatefulWidget {
  @override
  _TechStackState createState() => _TechStackState();
}

class _TechStackState extends State<TechStack> {

  Color defaultColor = Color(0xff1E6EFA);

  double cardWidth = 200.0;

  List stackItems = [
    {
      "label":"Flutter",
      "image":"assets/Tech-stack/pluginIcon.png",
      "percentage":90/100,
    },
    {
      "label":"Node",
      "image":"assets/Tech-stack/node.png",
      "percentage":70/100,
    },
    {
      "label":"React",
      "image":"assets/Tech-stack/react.png",
      "percentage":50/100,
    },
    {
      "label":"PHP",
      "image":"assets/Tech-stack/php.png",
      "percentage":65/100,
    },
    {
      "label":"MySQL",
      "image":"assets/Tech-stack/mysql.png",
      "percentage":65/100,
    },
    {
      "label":"Javascript",
      "image":"assets/Tech-stack/javascript-scalable-vector-graphics-logo-encapsulated-postscript-javascript-icon-e4da2b81d311dd9166955fdfc3b4470b.png",
      "percentage":40/100,
    },
    {
      "label":"Firebase Firestore",
      "image":"assets/Tech-stack/firebase.png",
      "percentage":80/100,
    },
    {
      "label":"HTML & CSS",
      "image":"assets/Tech-stack/html_css.png",
      "percentage":70/100,
    },
    {
      "label":"C++",
      "image":"assets/Tech-stack/the-c-programming-language-computer-icons-computer-programming-source-code-programming-379507b506bcaa225df9378940b22774.png",
      "percentage":40/100,
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:30.0),
        child: Column(
          children: [
              
              SizedBox(
                width: mq.width - 60.0,
                child: Wrap(
                  children: [
                    Text("Tech Stack",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: defaultColor,
                    ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20.0,
              ),

              Padding(
                padding:EdgeInsets.symmetric(horizontal: mq.width > 1200.0? (mq.width*.15) : 8.0,),
                child: techStackItem(),
              ),

              SizedBox(height: 60.0,),

              SizedBox(
                width: mq.width - 60.0,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                    Text("Resume`",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      color: defaultColor,
                    ),
                    ),
                  ],
                ),
              ), 

              SizedBox(height: 20.0,),

              SizedBox(
                width: mq.width - 120.0,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.spaceEvenly,
                  children: [
                    Text("Download my resume here",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).disabledColor,
                    ),
                  ),


                    MouseRegion(
                      cursor: SystemMouseCursors.click ,
                      child: GestureDetector(
                        onTap: (){
                          html.window.open("https://raw.githubusercontent.com/norbertkross/mycv/master/cv/CV.pdf", "Resume");
                        },
                        child: Card(
                          color: defaultColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20.0),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Text("Resume",style: TextStyle(
                                  color: Theme.of(context).canvasColor,
                                  fontSize: 18.0,
                                ),),
                                SizedBox(width: 10.0,),
                                Icon(Icons.arrow_downward_rounded,size: 30.0,color: Theme.of(context).canvasColor,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30.0,),

          ],
        ),
      ),
    );
  }

  Widget techStackItem(){
    return Wrap(
      alignment: WrapAlignment.center,
      children: [

        for(int index =0; index <= stackItems.length-1;index++)

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 16.0),
          child: Card(
            shadowColor: defaultColor,
            elevation: 20.0,
            child: Container(
              //color: Colors.green,
              width: cardWidth,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [

                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(                                           
                              height: 150.0 - 12.0,
                              decoration: BoxDecoration(
                              // color: Colors.redAccent,
                              image: DecorationImage(image: AssetImage(stackItems[index]["image"].toString())),
                              ),
                            ),
                          ),

                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Text(stackItems[index]["label"].toString(),style: TextStyle(
                            color: Theme.of(context).disabledColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),),
                        )
                      ],
                    ),
                  ),

                  Stack(
                    children: [
                      Container(
                        width: (cardWidth - 24.0),
                        height: 10.0,
                        decoration: BoxDecoration(
                          color: defaultColor,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          width: (cardWidth - 26.0) * stackItems[index]["percentage"],
                          height: 8.0,
                          decoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.0,),

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

}