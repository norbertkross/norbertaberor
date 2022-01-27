import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class UIChallenges extends StatefulWidget {
  @override
  _UIChallengesState createState() => _UIChallengesState();
}

class _UIChallengesState extends State<UIChallenges> {

  Color defaultColor = Color(0xff1E6EFA);

  List uiItems = [
    {
      "label":"Harmony",
      "image":"assets/uis/Screenshot_20210215-021158.png",
      "description":"lorem ipsium lorem ipsium dor sit dormeh lorem ipsium lorem ipsium dor sit dormeh lorem ipsium lorem ipsium",
      "images-list":[
        "assets/uis/Screenshot_20210215-021821.png",
        "assets/uis/Screenshot_20210215-021158.png",
      ],      
    },
    {
      "label":"Insurer",
      "image":"assets/uis/Screenshot_20210310-001648.png",
      "description":"lorem ipsium lorem ipsium dor sit dormeh lorem ipsium lorem ipsium dor sit dormeh lorem ipsium lorem ipsium",
      "images-list":[
        "assets/uis/Screenshot_20210310-001533.png",
        "assets/uis/Screenshot_20210310-001811.png",
        "assets/uis/Screenshot_20210310-001908.png",
        "assets/uis/Screenshot_20210310-001648.png",
      ],      
    },
    {
      "label":"OneBite",
      "image":"assets/uis/Screenshot_20210322-162551.png",
      "description":"lorem ipsium lorem ipsium dor sit dormeh lorem ipsium lorem ipsium dor sit dormeh lorem ipsium lorem ipsium",
      "images-list":[
        "assets/uis/Screenshot_20210322-162551.png",
      ],      
    },    
    {
      "label":"Bookburger",
      "image":"assets/uis/Screenshot (118)@3x.png",
      "description":"lorem ipsium lorem ipsium dor sit dormeh lorem ipsium lorem ipsium dor sit dormeh lorem ipsium lorem ipsium",
      "images-list":[
        "assets/uis/Screenshot (119)@3x.png",
        "assets/uis/Screenshot (121)@3x.png",
        "assets/uis/Screenshot (120)@3x.png",
        "assets/uis/Screenshot (118)@3x.png",        
      ],      
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;

    return Container(
      //color: Colors.redAccent,
      width: mq.width,
      child: Column(
        children: [

              Text("UI Challenges",
              // textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: defaultColor,
              ),
              ),

              SizedBox(height: 8.0,),

              Text("at times I make free UIs to share with the open source community",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).disabledColor,
              ),
            ),

            SizedBox(height: 45.0,),
            workItem(mq:mq),
            SizedBox(height: 20.0,),
            
        ],
      ),
    );
  }


  Widget workItem({Size mq}){
    return Stack(
      children: [
            Positioned(
              bottom: 0.0,
              right: 10.0,
              left: 10.0,
              child: Container(
                height: 100.0,
                width: mq.width,
                decoration: BoxDecoration(
                color: defaultColor,                  
                ),
              ),
            ),

        Wrap(
          alignment: WrapAlignment.center,
          children: [

            for(int index =0; index <= uiItems.length-1;index++)

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 16.0),
              child: Card(
                shadowColor: defaultColor.withOpacity(.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 20.0,
                child: Container(
                  //color: Colors.green,
                  width: 300.0,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [

                          SizedBox(
                            width: mq.width,
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              children: [
                                Icon(Icons.star_half_rounded,
                                color: Colors.red,),
                              ],
                            ),
                          ),

                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    opaque: false,
                                    pageBuilder: (pageBuilder,animation1,animation2)=>UIChallengeDetails(
                                      heroTag: "image-$index",
                                      items: uiItems[index]["images-list"],                                      
                                      ),
                                  ),);
                              },
                              child: Hero(
                                tag: "image-$index",
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.click ,
                                    child: Container(             
                                      height: 300.0 - 12.0,
                                      decoration: BoxDecoration(
                                      //color: Colors.limeAccent,
                                      image: DecorationImage(image: AssetImage("${uiItems[index]["image"]}")),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical:8.0),
                              child: Text(uiItems[index]["label"],style: TextStyle(
                                color: defaultColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                             ),
                            ),

                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    opaque: false,
                                    pageBuilder: (pageBuilder,animation1,animation2)=>UIChallengeDetails(
                                      heroTag: "arrow-$index",
                                      items: uiItems[index]["images-list"],
                                      ),
                                  ),);
                              },                          
                              child: Hero(
                                tag: "arrow-$index",
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: RotatedBox(quarterTurns: 3,
                                  child: Icon(Icons.chevron_left,color: Theme.of(context).disabledColor,),),
                                ),
                              ),
                            )

                          ],
                        ),
                      ),                  
                    ],
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


class UIChallengeDetails extends StatefulWidget {
  final String heroTag;
  final List items;

  const UIChallengeDetails({Key key, this.heroTag, this.items}) : super(key: key);

  @override
  _UIChallengeDetailsState createState() => _UIChallengeDetailsState();
}

class _UIChallengeDetailsState extends State<UIChallengeDetails> {

  Color defaultColor = Color(0xff1E6EFA);
  int curerrent = 0;

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;
    return Hero(
      tag: widget.heroTag ?? "tag",      
      child: GestureDetector(
        onTap: ()=>Navigator.pop(context),
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            color: Colors.black.withOpacity(.7),
            child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (__){
            __.disallowGlow();
            return false;
            },
            child: ListView(
              children: [

            SizedBox(height: mq.height*.10,),

            Column(
              children: [
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    width: mq.width >1000?(mq.width * .7) : (mq.width * .9),        
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical:mq.width > 600? 28.0:8.0),
                      child: Column(
                        children: [ 

                          SizedBox(
                            width: mq.width >1000?(mq.width * .7) : (mq.width * .9),
                             child: Wrap(
                               alignment: WrapAlignment.end,
                              children: [
                                 Padding(
                                   padding: const EdgeInsets.only(right:12.0),
                                   child: IconButton(icon: Icon(Icons.close,color:Colors.red),
                                    onPressed: ()=>Navigator.pop(context)),
                                 ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: mq.width >1000?(mq.width * .7) : (mq.width * .9),
                              height: mq.width > 600? (mq.height* .7) : mq.width*.55,
                              decoration: BoxDecoration(
                                // color: Colors.amberAccent,
                              image: DecorationImage(image: AssetImage("${widget.items[curerrent]}")),
                              ),
                            ),
                          ),

                          SizedBox(
                            width:mq.width >1000?(mq.width * .7) : (mq.width * .9),
                            child: Wrap(
                              alignment: WrapAlignment.spaceEvenly,
                              children: [

                              curerrent != 0 && widget.items.length>1 ?  
                              GestureDetector(
                                  onTap: (){
                                    if(curerrent != 0){
                                      setState(() {
                                        curerrent--;                                      
                                      });
                                    }                                  
                                  },
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: Icon(
                                    Icons.chevron_left,
                                    color: Theme.of(context).disabledColor.withOpacity(.6),
                                    ),
                                  ),): Container(height: 25,width: 25,),

                              curerrent != widget.items.length-1 && widget.items.length>1 ?  GestureDetector(
                                  onTap: (){
                                    if(curerrent != widget.items.length-1){
                                      setState(() {
                                        curerrent++;                                      
                                      });
                                    }
                                  },
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: Icon(
                                    Icons.chevron_right,
                                    color: Theme.of(context).disabledColor.withOpacity(.6),
                                    ),
                                  ),): Container(height: 25,width: 25,),
                              ],
                            ),
                          ),

                          SizedBox(
                          width:mq.width >1000?(mq.width * .7) : (mq.width * .9),
                          child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            for(int i = 0; i<= widget.items.length-1;i++)
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(                
                                height: 10.0,
                                width: 10.0,
                                decoration: BoxDecoration(
                                  color:i==curerrent?defaultColor : defaultColor.withOpacity(.3),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                                ),
                               ],
                              ),
                             ),
                            ],
                          ),
                    ),
                  ),
                ),

                SizedBox(height:mq.width > 500? 40.0:10.0,),
              ],
            ),
              ],
            ),
            ),
          ),
        ),
      ),
    );
  }
}