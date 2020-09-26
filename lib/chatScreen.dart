import 'package:flutter/material.dart';

class Chatscreen extends StatefulWidget {
  @override
  _ChatscreenState createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Chats",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),     
      ),
      actions: [
        new Icon(Icons.video_call,size: 30,color: Colors.white,),
        new Padding(padding: const EdgeInsets.symmetric(horizontal: 10)),
        new Icon(Icons.edit,size: 30,color: Colors.white,)
      ],
    ),
    body: new Container(
      padding: const EdgeInsets.all(10),
      child: new Column(
        children: [
          new Text("Messages",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
          new Padding(padding: const EdgeInsets.only(top: 15),),
          new Row(
            children: [
              new CircleAvatar(
                child: new Text("U1",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                backgroundColor: Colors.blue[800],
                radius: 25,
              ),
              new Padding(padding: const EdgeInsets.symmetric(horizontal: 5)),
              new Column(
                children: [
                  new Text("user_1",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                  new Padding(padding: const EdgeInsets.symmetric(vertical: 2)),
                  new Text("testing",style: TextStyle(fontSize: 20,color: Colors.grey[600]),),
                ],
              ),
              new Padding(padding: const EdgeInsets.symmetric(horizontal: 110)),
              new Icon(Icons.camera,size: 30,color: Colors.white,),
            ],
          )
        ],
      ),
    ),
    );
  }
}