import 'package:flutter/material.dart';


class AboutNorbertAberor extends StatefulWidget {
  @override
  _AboutNorbertAberorState createState() => _AboutNorbertAberorState();
}

class _AboutNorbertAberorState extends State<AboutNorbertAberor> {
  double cardWidth = 250.0;
  double cardPadding = 130.0;
  double pictureBorder = 16.0;
  Color defaultColor = Color(0xff1E6EFA);
  
  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;

    double containerWidth = mq.width < 501 ?mq.width -40.0 : mq.width*.65;
    return Center(
      child: Container(
        width:  (containerWidth + cardWidth),
        child: Stack(
          children: [
            
            Padding(
              padding: mq.width > 800? EdgeInsets.only(left: cardWidth *.70,right: 30.0) : EdgeInsets.only(top:260.0),
              child: Column(
                children: [
                  SizedBox(
                    width: mq.width,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Container(
                          //padding: EdgeInsets.all(0.0),
                          width: containerWidth,
                          decoration: BoxDecoration(
                            //color: Colors.tealAccent,
                            border: Border.all(width: 2.0,color: defaultColor,),
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0),),
                          ),            
                          child: Padding(
                            padding: mq.width > 800? EdgeInsets.only(left: (cardWidth *.30) + 10.0) : EdgeInsets.all(0.0),
                            child: Container(
                           //color: Colors.redAccent,
                              child: Column(
                              crossAxisAlignment:mq.width > 800? CrossAxisAlignment.start : CrossAxisAlignment.center,
                                children: [
                                  
                                    SizedBox(
                                      height: mq.width > 1080? mq.width *.05 : 40.0,
                                    ),

                                  SizedBox(height: mq.width <=800?10.0: 0.0,),
                                  // Text("Hi der, I am",style: TextStyle(
                                  //   color: Theme.of(context).disabledColor,
                                  //   fontSize: 22.0,
                                  // ),),

                                  // SizedBox(height: 20.0,),

                                  // Padding(
                                  //   padding:mq.width > 800? EdgeInsets.symmetric(horizontal: containerWidth *.05) : EdgeInsets.all(10.0),
                                  //   child: Text("ABEROR NORBERT EUGENE",
                                  //   textAlign:TextAlign.center,
                                  //   // textAlign:mq.width > 800? null:TextAlign.center,
                                  //   style: TextStyle(
                                  //     color: Theme.of(context).disabledColor.withOpacity(.6),
                                  //     fontSize: 40.0,
                                  //     fontWeight: FontWeight.w500,
                                  //   ),),
                                  // ),
                                  Padding(
                                    padding:mq.width > 800? EdgeInsets.symmetric(horizontal: containerWidth *.05) : EdgeInsets.all(10.0),
                                    child: Text("Who Am I",
                                    textAlign:TextAlign.center,
                                    // textAlign:mq.width > 800? null:TextAlign.center,
                                    style: TextStyle(
                                      color: Theme.of(context).disabledColor.withOpacity(.6),
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.w500,
                                    ),),
                                  ),

                                  SizedBox(height: 15.0,),

                                  Padding(
                                    padding: mq.width > 800? EdgeInsets.symmetric(horizontal:containerWidth*.15) : EdgeInsets.all(10.0),
                                    child: Divider(thickness: 2.5,),
                                  ),
                                
                                SizedBox(height: 10.0,),

                                  Padding(
                                    padding: mq.width > 800? EdgeInsets.symmetric(horizontal:containerWidth*.20) : EdgeInsets.all(10.0),
                                    child: Text("I like to think of myself as a problem solver, looking forward to build real,great products that solve some of the problems our societies face. I enjoy meeting new people and finding ways to help them have an uplifting experince. I am a passionate developer who love to write code to solve problems.",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Theme.of(context).disabledColor.withOpacity(.6),
                                      fontSize: 22.0,
                                    ),),
                                  ),

                                    SizedBox(
                                      height: mq.width > 1080? mq.width *.07 : 40.0,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(0.0),
                    width: containerWidth,
                    height: 25.0,
                    decoration: BoxDecoration(
                      color: defaultColor,
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0),),
                    ),
                  ),
                ],
              ),
            ),


          mq.width > 800? Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0,),
                  child: Card(
                    margin: EdgeInsets.all(0.0),
                    elevation: 30.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(pictureBorder),
                    ),
                    child: Container(
                      height: 300.0,
                      width: cardWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(pictureBorder),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/uis/IMG_20201205_164357_294.jpg")),
                      ),
                    ),
                  ),
                ),
              ],
            ):Container(),


          // On a smaller Screen
          mq.width <= 800?  SizedBox(
            width: mq.width,
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0,),
                      child: Card(
                        margin: EdgeInsets.all(0.0),
                        elevation: 30.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(pictureBorder),
                        ),
                        child: Container(
                          height: 300.0,
                          width: cardWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(pictureBorder),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/uis/IMG_20201205_164357_294.jpg")),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ):Container()            

          ],
        ),
      ),
    );
  }
}