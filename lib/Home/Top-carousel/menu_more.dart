import 'package:flutter/material.dart';
import 'dart:html' as html;

class MenuMore extends StatefulWidget {
  final ValueChanged<bool> showDialog;
  const MenuMore({ Key key, this.showDialog }) : super(key: key);

  @override
  _MenuMoreState createState() => _MenuMoreState();
}

class _MenuMoreState extends State<MenuMore> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
  Size mq = MediaQuery.of(context).size;
  bool isOpened = false;

    return AnimatedSize(
    duration: Duration(
      milliseconds: 600,
    ), 
    vsync: this,
    child:GestureDetector(
            onTap: (){
              setState(() {
                  isOpened = false;
                  widget.showDialog?.call(isOpened);                                  
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
                            widget.showDialog?.call(isOpened);
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
                        color: Theme.of(context).canvasColor,
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
                        color: Theme.of(context).canvasColor,
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