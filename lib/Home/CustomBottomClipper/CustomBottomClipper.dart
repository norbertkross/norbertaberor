import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:html' as html;

class CustomBottomClipper extends StatefulWidget {
  @override
  _CustomBottomClipperState createState() => _CustomBottomClipperState();
}

class _CustomBottomClipperState extends State<CustomBottomClipper> {

  Color defaultColor = Color(0xff1E6EFA);

  List links = [
    {"logo": "assets/LinkedIn_104px@3x.png",
     "link":"https://www.linkedin.com/in/norbert-aberor-a75996162",
    },
    {"logo": "assets/YouTube%202_96px@3x.png",
     "link":"https://www.youtube.com/channel/UCPUkuP2vx9jxTnMvdV-cgrA",
    },
    {"logo": "assets/GitHub_96px@3x.png",
     "link":"https://www.github.com/norbertkross",
    },
    {"logo": "assets/Twitter_104px@3x.png",
     "link":"https://twitter.com/norbertaberor?s=09",
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;
    double painterHeight = 350.0;
    return Column(
      children: [
        SizedBox(height: 200,),

              SizedBox(
                width: mq.width,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:15.0),
                      child: Container(
                        width: mq.width> 550? 200.0 : 150.0,
                        height: mq.width> 550? 200.0 : 150.0,
                        decoration: BoxDecoration(
                          //color: Colors.green,
                          image: DecorationImage(image: AssetImage("assets/Avatar-33.png")),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

        SizedBox(height: 30.0,),

        SizedBox(
          width: mq.width,
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Container(
                height: 30.0,
                width: 30.0,
                child: Image.asset("assets/Icon%20awesome-location-arrow@3x.png"),
                ),

                SizedBox(width: 20.0,),

                Text("Say hello at",style: TextStyle(
                  color: Theme.of(context).disabledColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 24.0,
                ),),

                Padding(
                  padding: const EdgeInsets.only(left:4.0),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: (){
                        html.window.open("mailto:norbertaberor@gmail.com?subject=I saw your portfolio online and would love to get in touch&body=Dear Norbert, \n We saw your Portfolio and we would love to get in touch to know the posibility of you joining our company. Kindly send us your resume to the address below", "Mail");
                      },
                      child: Text("norbertaberor@gmail.com",style: TextStyle(
                        color: defaultColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 24.0,
                      ),),
                    ),
                  ),
                ),
            ],
          ),
        ),
        
          SizedBox(height: 10.0,),

            Text("or Interact",style: TextStyle(
              color: Theme.of(context).disabledColor.withOpacity(.35),
              fontWeight: FontWeight.bold,
              fontSize: 21.0,
            ),),   

          SizedBox(height: 30.0,),       

        Stack(
          children: [
            CustomPaint(
              size: Size(mq.width,painterHeight), //You can Replace this with your desired WIDTH and HEIGHT
              painter: RPSCustomPainter(),
            ),
              SizedBox(
                width: mq.width,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Container(
                      child: Icon(Icons.arrow_downward_rounded,color: defaultColor,size: mq.width> 550?60.0: 45.0,),
                    ),
                  ],
                ),
              ), 


              Positioned(
                top: 0.0,
                child: SizedBox(
                  width: mq.width,
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:15.0),
                        child: Container(
                          width: mq.width> 550? 100.0 : 60.0,
                          height: mq.width> 550? 100.0 : 60.0,
                          decoration: BoxDecoration(
                            //color: Colors.orangeAccent,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/Avatar-34.png")),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),            

            Positioned(
              bottom: 60.0,
              child: SizedBox(
                width: mq.width,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [

                  for(int k =0;k <= links.length-1;k++)                        
                    GestureDetector(
                      onTap: (){
                        // link links[k]["link"]
                          html.window.open(links[k]["link"].toString(), "New Tab");
                        
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal:16.0),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click ,
                          child: Container(
                          height: 60.0,
                          width: 60.0,                          
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    //color: Colors.orangeAccent,
                                    borderRadius: BorderRadius.circular(25.0),
                                    image: DecorationImage(image: AssetImage("${links[k]["logo"]}")),

                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),


              Positioned(
                top: painterHeight *.4,
                child: SizedBox(
                  width: mq.width,
                  child: Wrap(
                    alignment: WrapAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right:15.0),
                        child: Container(
                          width: mq.width> 550? 120.0 : 60.0,
                          height: mq.width> 550? 120.0 : 60.0,
                          decoration: BoxDecoration(
                           // color: Colors.yellow,
                            image: DecorationImage(image: AssetImage("assets/Avatar-22.png")),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),            



          Positioned(
            bottom: 8.0,
            right: 0.0,
            left: 0.0,
            child: Center(child: Text("©2021 norbertaberor",
            style: TextStyle(
              color: Theme.of(context).canvasColor,
              fontWeight: FontWeight.w500,
              fontSize: 19.0,
             ),
            ),
           ),
         ),

          ],
        ),
      ],
    );
  }
}


class RPSCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  Paint paint_0 = new Paint()
      ..color =   Color(0xff1E6EFA)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;
     
         
    Path path_0 = Path();
    path_0.moveTo(0,size.height);
    path_0.lineTo(size.width,size.height);
    path_0.lineTo(size.width,size.height*0.60);
    path_0.lineTo(0,0);

    canvas.drawPath(path_0, paint_0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
