import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Works extends StatefulWidget {
  @override
  _WorksState createState() => _WorksState();
}

class _WorksState extends State<Works> {

  Color defaultColor = Color(0xff1E6EFA);


  List workItems = [
    {
      "label":"Resumefolio",
      "image":"assets/uis/Screenshot_20210328-074157.png",
      "description":"Resumfolio is a mobile application created to help people who want to create resumes in fast and easily. The app is available on playstore",
      "images-list":[
        "assets/uis/Screenshot_20210328-074209.png",
        "assets/uis/Screenshot_20210328-074259.png",
        "assets/uis/Screenshot_20210328-074325.png",
        "assets/uis/Screenshot_20210328-074157.png",
        "assets/uis/Screenshot_20210328-074359222.png",

      ],      
    },
    {
      "label":"FunHolidays",
      "image":"assets/uis/Screenshot_20210328-080008.png",
      "description":"Funholidays is a hotel management app which enables guests chat with themselves and hotel staff, order food and others.",
      "images-list":[
        "assets/uis/Screenshot_20210328-080024.png",
        "assets/uis/Screenshot_20210328-080008.png",
      ],      
    },
    {
      "label":"Codeishweb",
      "image":"assets/uis/Screenshot (27).png",
      "description":" The codeish website was created deliver quality learning materials and tutorials to people who wnat to learn coding",
      "images-list":[
        "assets/uis/Screenshot (26).jpg",
        "assets/uis/Screenshot (27).png",
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
              Text("Works",
              // textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: defaultColor,
              ),
              ),

              SizedBox(height: 8.0,),

              Text("A few projects I have worked on",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).disabledColor,
              ),
            ),

            SizedBox(height: 45.0,),
            workItem(),
            
        ],
      ),
    );
  }


  Widget workItem(){
    return Wrap(
      alignment: WrapAlignment.center,
      children: [

        for(int index =0; index <= workItems.length -1;index++)

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 16.0),
          child: MouseRegion(
            cursor: SystemMouseCursors.click ,
            child: Card(
              shadowColor: defaultColor.withOpacity(.5),    
              elevation: 20.0,
              child: GestureDetector(
               onTap: (){
                Navigator.of(context).push(
                  PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (pageBuilder,animation1,animation2)=>WorksDetails(
                      heroTag: "image-$index",
                      items: workItems[index]["images-list"],
                      ),
                  ),);               
               },              
                child: Hero(
                  tag: "tag-$index",
                  child: Container(
                    //color: Colors.green,
                    width: 300.0,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(             
                                  height: 230.0 - 12.0,
                                  decoration: BoxDecoration(
                                  //color: Colors.limeAccent,
                                  image: DecorationImage(image: AssetImage("${workItems[index]["image"]}")),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(vertical:8.0),
                                child: Text(workItems[index]["label"],style: TextStyle(
                                  color: Theme.of(context).disabledColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),),
                              )
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0,),
                          child: Container(
                            height: 4.0,
                            decoration: BoxDecoration(
                              color: defaultColor,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),


                        Container(
                          //color: Colors.pinkAccent,
                          height: 150.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left:12.0,right:12.0,bottom: 20.0,top: 12.0),
                            child: Text( workItems[index]["description"],
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              color: defaultColor,
                              fontSize: 18.0,
                            ),
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
        ),
      ],
    );
  }

}




class WorksDetails extends StatefulWidget {
  final String heroTag;
  final List items;

  const WorksDetails({Key key, this.heroTag, this.items}) : super(key: key);

  @override
  _WorksDetailsState createState() => _WorksDetailsState();
}

class _WorksDetailsState extends State<WorksDetails> {

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