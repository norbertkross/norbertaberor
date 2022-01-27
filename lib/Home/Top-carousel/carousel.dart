import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:html' as html;

class HomeCarousel extends StatefulWidget {
  final ValueChanged<bool> isBright;

  const HomeCarousel({Key key, this.isBright}) : super(key: key);

  @override
  _HomeCarouselState createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> with TickerProviderStateMixin{

bool isBright = false;

List carouselItemsList = [
  {
    "image":AssetImage("assets/Avatar-34.png"),    
    "headertext":"Critical Thinker",
    "subhead":"I analize things critically",    
    "color":Color(0xff1a4ff7),
  },
  // {
  //   "image":AssetImage("assets/Avatar-34.png"),    
  //   "headertext":"Critical Thinker",
  //   "subhead":"I analize things critically",    
  //   "color":Color(0xff1E6EFA),
  // },
  {
    "image":AssetImage("assets/Avatar-36.png"),
    "headertext":"Passionate",
    "subhead":"I am passionate about what I do",
    "color":Color(0xffE42C2C),
  },
  {
    "image":AssetImage("assets/Avatar-23.png"),
    "headertext":"Leader",
    "subhead":"I have lead a few teams",
    // "color":Color(0xffB0FA1E),
    "color":Color(0xff04E824),
  },  
  {
   "image":AssetImage("assets/Avatar-1.png"),
   //"image":AssetImage("assets/Avatar-16.png"),
    "headertext":"Enthusiastic and Energetic",
    "subhead":"I have great personal drive",
    "color":Color(0xffC602FF),
  },
];


  PageController pageController = PageController(initialPage: 0,keepPage: true);

  int currentIndex = 0;

  // Controlling Carousel from init State
  autoSlideCarousel(){

     if(currentIndex < carouselItemsList.length){
       if(pageController.hasClients){
          pageController.animateToPage(
          currentIndex++, 
          duration: Duration(milliseconds: 600), 
          curve: Curves.easeIn,);          
        }

    }else{
      if(pageController.hasClients){
         pageController.jumpToPage(0);
      }
    }
  }


  // controlling carousel forward manually
  moveForward(){
    if(pageController.hasClients){
      if(currentIndex < carouselItemsList.length){
          if(pageController.hasClients){
          pageController.animateToPage(
          currentIndex++, 
          duration: Duration(milliseconds: 600), 
          curve: Curves.easeIn,);          
        }
      }else{
      if(pageController.hasClients){
      pageController.jumpToPage(0);
        }
      }
    }    
  }


  // controlling carousel Backward manually
  moveBackward(){
    if(pageController.hasClients){
      if(currentIndex > 0){
          if(pageController.hasClients){
          pageController.previousPage(
          duration: Duration(milliseconds: 600), 
          curve: Curves.easeIn,
          );

        }
      }
    }    
  }

  bool isOpened = false;

  @override
  void initState(){ 
    super.initState();
    Timer.periodic(Duration(milliseconds:3000), 
    (_){autoSlideCarousel();});
  }

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
                width: mq.width,
                height: mq.height+20.0,
                child: Stack(
                  children: [
                    Container(
                      width: mq.width,
                      height: mq.height+20.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/daniel-korpai-mxPiMiz7KCo-unsplash.jpg"),),
                      ),            
                    ),                    
                    PageView.builder(
                      onPageChanged:  (value) {
                          setState(() {
                            currentIndex = value;
                          });
                      },
                      controller: pageController,
                      itemCount: carouselItemsList.length,
                      itemBuilder: (itemBuilder,index){

                      return 
                      index == 0?
                      firstCarouselItem(
                      mq,
                      color: carouselItemsList[index]["color"],
                      image: carouselItemsList[index]["image"],
                      headertext: carouselItemsList[index]["headertext"],
                      subhead: carouselItemsList[index]["subhead"],
                      ):
                      carouselItem(
                      mq,
                      color: carouselItemsList[index]["color"],
                      image: carouselItemsList[index]["image"],
                      headertext: carouselItemsList[index]["headertext"],
                      subhead: carouselItemsList[index]["subhead"],
                      );
                    }),

                    
                    SizedBox(
                      width: mq.width,
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.spaceBetween,
                        children: [
                          
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0,top: 20.0),
                            child: Text("NA",style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).canvasColor,
                            ),),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(right:20.0,top: 20.0),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [

                                GestureDetector(
                                  onTap: (){
                                  setState(() {
                                    isBright = !isBright;
                                    widget.isBright?.call(isBright);
                                  });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                                    child: MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: Icon(Icons.brightness_4,size: 32.0,
                                      color: Theme.of(context).canvasColor.withOpacity(.6),),
                                    ),
                                  ),
                                ),

                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                       isOpened = true;                                  
                                    });
                                  },
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.click ,
                                    child: Icon(Icons.menu,
                                    size: 40.0,color: Theme.of(context).canvasColor,),
                                  ),
                                  ),
                              ],
                            ),
                          ), 
                          

                        ],
                      ),
                    ),
                  ],
                ),            
              ),

              opaqueLayer(mq:mq,),

      ],
    );
  }

  Widget carouselItem(Size mq,{ImageProvider<Object> image,String headertext,String subhead,Color color}){
    return Stack(
      children: [

        Container(
          width: mq.width,
          height: mq.height+20.0,
          decoration: BoxDecoration(
            color: color != null?color.withOpacity(.96) : Color(0xff1E6EFA).withOpacity(.96),
          ),          
        ),

        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

                SizedBox(
                  width: mq.width,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      
                      Text("NA",style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.transparent
                      ),),

                      GestureDetector(
                        onTap: (){},
                        child: Container(height: 45.0,width: 45.0,color: Colors.transparent,)
                        //Icon(Icons.menu,size: 45.0,color: Theme.of(context).canvasColor,)
                        ,
                        ),                              
                    ],
                  ),
                ),


              // Arrows and images

                Stack(
                  children: [


                    SizedBox(
                      width: mq.width,
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.spaceBetween,
                        children: [

                        mq.width >500?  GestureDetector(
                            onTap: (){
                              moveBackward();
                            },
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click ,
                              child: Icon(Icons.arrow_back_rounded,
                              size: 35.0,color: Theme.of(context).canvasColor,),
                            ),
                            ) : Container(
                              width: 35.0,
                              height: 35.0,
                            ),                            

                          Container(
                            width: 350.0,
                            height: 350.0,
                            decoration: BoxDecoration(
                              //color: Colors.white,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: image?? AssetImage("assets/Avatar-22.png"),
                                ),
                            ),
                          ),

                        mq.width >500? GestureDetector(
                            onTap: (){
                              moveForward();
                            },
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Icon(Icons.arrow_forward_rounded,
                              size: 35.0,color: Theme.of(context).canvasColor,),
                            ),
                            ) : Container(
                              width: 35.0,
                              height: 35.0,
                            ),                          
                        ],
                      ),
                    ),
                  ],
                ),



              // Base Label

                SizedBox(
                  width: mq.width,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      
                      SizedBox(width: 1.0,),

                      Column(
                        children: [
                         
                      Wrap(
                        children: [
                          for(int j =0; j<= carouselItemsList.length-1;j++) 
                          //if(currentIndex == 0 || currentIndex == carouselItemsList.length-1)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 2.0),
                            child: Container(
                              height: 10.0,
                              width: 10.0,
                              decoration: BoxDecoration(
                                color: currentIndex == j ? Theme.of(context).canvasColor : Theme.of(context).canvasColor.withOpacity(.4),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Text(headertext ?? "Funny Person",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).canvasColor,
                      ),),

                    SizedBox(height: 12.0,),

                      Text( subhead ?? "I'm a funny person",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).canvasColor,
                      ),),

                    SizedBox(height: 6.0,),

                      RotatedBox(quarterTurns: 3,
                      child: Icon(Icons.chevron_left,size: 30.0,color: Theme.of(context).canvasColor,),),

                        ],
                      ),

                      SizedBox(width: 1.0,),                                                 
                    ],
                  ),
                ),
              ],
          ),
        ),
      ],
    );
  }



  Widget firstCarouselItem(Size mq,{ImageProvider<Object> image,String headertext,String subhead,Color color}){
    
    final TextStyle smallText = TextStyle(
      fontSize: 24,
      color: Theme.of(context).canvasColor,
    );
    final TextStyle largeText = TextStyle(
      fontSize: 60,
      color:Theme.of(context).canvasColor,
      fontWeight: FontWeight.bold,       
    );
    final TextStyle smallTextDecorated = TextStyle(
      fontSize: 28,
      color:Colors.orangeAccent,
    );
    final TextStyle largeTextDecorated = TextStyle(
      fontSize: 60,
      color:Colors.orangeAccent,
      fontWeight: FontWeight.bold,     
    );
    return Stack(
      children: [
        Container(
          width: mq.width,
          height: mq.height+20.0,
          decoration: BoxDecoration(
            color: color != null?color.withOpacity(.96) : Color(0xff1E6EFA).withOpacity(.96),
          ),          
        ),

        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

                SizedBox(
                  width: mq.width,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      
                      Text("NA",style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.transparent
                      ),),

                      GestureDetector(
                        onTap: (){},
                        child: Container(height: 45.0,width: 45.0,color: Colors.transparent,)
                        //Icon(Icons.menu,size: 45.0,color: Theme.of(context).canvasColor,)
                        ,
                        ),                              
                    ],
                  ),
                ),


              // Arrows and images

                Stack(
                  children: [


                    SizedBox(
                      width: mq.width,
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.spaceBetween,
                        children: [

                        mq.width >500?  GestureDetector(
                            onTap: (){
                              moveBackward();
                            },
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click ,
                              child: Icon(Icons.arrow_back_rounded,
                              size: 35.0,color: Theme.of(context).canvasColor,),
                            ),
                            ) : Container(
                              width: 35.0,
                              height: 35.0,
                            ),                            

                            Column(
                              children: [
                                RichText(
                                  textAlign:TextAlign.center,
                                  text: TextSpan(
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: "Hi,",
                                      style: smallTextDecorated,
                                    ),
                                    TextSpan(
                                      text: " I am",
                                      style: smallText,
                                    ),
                                  ],
                                )),
                                RichText(
                                  textAlign:TextAlign.center,
                                  text: TextSpan(
                                  children: <InlineSpan>[

                                    TextSpan(
                                      text: "Norb",
                                      style: largeText,
                                    ),
                                    TextSpan(
                                      text: "er",
                                      style: largeTextDecorated,
                                    ),
                                    TextSpan(
                                      text: "t",
                                      style: largeText,
                                    ),

                                    TextSpan(
                                      text: " Ab",
                                      style: largeText,
                                    ),
                                    TextSpan(
                                      text: "e",
                                      style: largeTextDecorated,
                                    ),
                                    TextSpan(
                                      text: "ro",
                                      style: largeText,
                                    ),
                                    TextSpan(
                                      text: "r",
                                      style: largeTextDecorated,
                                    ),

                                  ],
                                )),
                              ],
                            ),
                          // Container(
                          //   width: 350.0,
                          //   height: 350.0,
                          //   decoration: BoxDecoration(
                          //     //color: Colors.white,
                          //     image: DecorationImage(
                          //       fit: BoxFit.cover,
                          //       image: image?? AssetImage("assets/Avatar-22.png"),
                          //       ),
                          //   ),
                          // ),

                        mq.width >500? GestureDetector(
                            onTap: (){
                              moveForward();
                            },
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Icon(Icons.arrow_forward_rounded,
                              size: 35.0,color: Theme.of(context).canvasColor,),
                            ),
                            ) : Container(
                              width: 35.0,
                              height: 35.0,
                            ),                          
                        ],
                      ),
                    ),
                  ],
                ),



              // Base Label

                SizedBox(
                  width: mq.width,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      
                      SizedBox(width: 1.0,),

                      Column(
                        children: [
                         
                      Wrap(
                        children: [
                          for(int j =0; j<= carouselItemsList.length-1;j++) 
                          //if(currentIndex == 0 || currentIndex == carouselItemsList.length-1)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 2.0),
                            child: Container(
                              height: 10.0,
                              width: 10.0,
                              decoration: BoxDecoration(
                                color: currentIndex == j ? Theme.of(context).canvasColor : Theme.of(context).canvasColor.withOpacity(.4),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        ],
                      ),

                    //   Text(headertext ?? "Funny Person",
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: 32.0,
                    //     fontWeight: FontWeight.bold,
                    //     color: Theme.of(context).canvasColor,
                    //   ),),

                    // SizedBox(height: 12.0,),

                    //   Text( subhead ?? "I'm a funny person",
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: 18.0,
                    //     fontWeight: FontWeight.w300,
                    //     color: Theme.of(context).canvasColor,
                    //   ),),

                    SizedBox(height: 6.0,),

                      RotatedBox(quarterTurns: 3,
                      child: Icon(Icons.chevron_left,size: 30.0,color:Colors.transparent,),),

                        ],
                      ),

                      SizedBox(width: 1.0,),                                                 
                    ],
                  ),
                ),
              ],
          ),
        ),
      ],
    );
  }

  Widget opaqueLayer({Size mq}){
  return AnimatedSize(
    duration: Duration(
      milliseconds: 600,
    ), 
    vsync: this,
    child:isOpened == false ? Container(
            height: .001,
          ) : GestureDetector(
            onTap: (){
              setState(() {
                  isOpened = false;                                  
              });              
            },
            child: Container(
      color: Colors.black.withOpacity(.92),
      width: mq.width,
      height: mq.height,
      child: NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (__){
      __.disallowGlow();
      return false;
      },
      child: ListView(
        children: [
         
            Column(
              children: [
            SizedBox(
              width: mq.width,
              child: Wrap(
                alignment: WrapAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: IconButton(
                      icon: Icon(Icons.close,color: Theme.of(context).canvasColor,size: 35.0,),
                      onPressed: (){
                        setState(() {
                            isOpened = false;                                  
                        });                      
                      }),
                  ),
                ],
              ),
            ),

            SizedBox(height: mq.height*.3,),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:16.0),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: (){
                       html.window.open("https://www.youtube.com/channel/UCPUkuP2vx9jxTnMvdV-cgrA", "New Tab");                                            
                      },
                      child: Text("YouTube",style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontSize: 34.0,
                      ),),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:16.0),
                  child: GestureDetector(
                    onTap: (){
                       html.window.open("https://www.linkedin.com/in/norbert-aberor-a75996162", "name");
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Text("LinkedIn",style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontSize: 34.0,
                      ),),
                    ),
                  ),
                ),
              ],
            ),
            
              ],
            ),
        ],
      ),
      ),
    ),
          ),
    );    
  }
  
}