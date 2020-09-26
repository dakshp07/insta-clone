import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta_clone_app/chatScreen.dart';
import 'package:insta_clone_app/profilePage.dart';

class HomeScreen extends StatefulWidget {

  final User cuuser;
  HomeScreen({this.cuuser});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Clone",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
        actions: [
          new IconButton(
            icon: new Icon(Icons.send,color: Colors.white,size: 25,), 
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Chatscreen()));
          })
        ],
      ),
      body: new Column(
        children: [
          new Container(
            padding: const EdgeInsets.all(8),
            color: Colors.grey[800],
            child: new Row(
              children: [
                new Column(
                    children: [
                    new CircleAvatar(
                    child: new Text("DP",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
                    backgroundColor: Colors.green[800],
                    radius: 20,
                  ),
                  new Text("Add Your Story",style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),),
                    ],
                ),
                new Padding(padding: const EdgeInsets.symmetric(horizontal: 5)),
                new Column(
                    children: [
                    new CircleAvatar(
                    child: new Text("U1",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
                    backgroundColor: Colors.blue[800],
                    radius: 20,
                  ),
                  new Text("user_1",style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),),
                    ],
                ),
                new Padding(padding: const EdgeInsets.symmetric(horizontal: 8)),
                new Column(
                    children: [
                    new CircleAvatar(
                    child: new Text("U2",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
                    backgroundColor: Colors.yellow[800],
                    radius: 20,
                  ),
                  new Text("user_2",style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),),
                    ],
                ),
              ],
            ),
          ),
          new Padding(padding: const EdgeInsets.all(10)),
          new Row(
            children: [
              new CircleAvatar(
                child: new Text("U2",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
                backgroundColor: Colors.yellow[800],
                radius: 20,
              ),
              new Padding(padding: const EdgeInsets.symmetric(horizontal: 10)),
              new Text("user_2",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)),
            ],
          ),
          new Padding(padding: const EdgeInsets.only(top: 5)),
          new Image.network("https://images.pexels.com/photos/459203/pexels-photo-459203.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
          new Padding(padding: const EdgeInsets.only(top: 5)),
          new Row(
            children: [
              new Padding(padding: const EdgeInsets.symmetric(horizontal: 5),),
              new Icon(Icons.favorite_border,size: 25,color: Colors.white,),
              new Padding(padding: const EdgeInsets.symmetric(horizontal: 10),),
              new Icon(Icons.add_comment,size: 25,color: Colors.white,),
              new Padding(padding: const EdgeInsets.symmetric(horizontal: 10),),
              new Icon(Icons.send,color: Colors.white,size: 25,),
              new Padding(padding: const EdgeInsets.symmetric(horizontal: 125),),
              new Icon(Icons.bookmark_border,color: Colors.white,size: 25,),
            ],
          ),
          new Padding(padding: const EdgeInsets.only(top: 8)),
          new Row(
            children: [
              new Padding(padding: const EdgeInsets.symmetric(horizontal: 8)),
              new Text("1 like",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)),
            ],
          ),
          new Padding(padding: const EdgeInsets.only(top: 8)),
          new Row(
            children: [
            new Padding(padding: const EdgeInsets.symmetric(horizontal: 8)),  
            new Text("user_2",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
            new Padding(padding: const EdgeInsets.symmetric(horizontal: 5)),
            new Text("Nature at its best",style: TextStyle(fontSize: 20,color: Colors.white),),
            ],
          ),
          new Padding(padding: const EdgeInsets.only(top: 8)),
          new Row(
            children: [
            new Padding(padding: const EdgeInsets.symmetric(horizontal: 8)),  
            new Text("dakshp07",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
            new Padding(padding: const EdgeInsets.symmetric(horizontal: 5)),
            new Text("🔥🔥😍",style: TextStyle(fontSize: 20,color: Colors.white),),
            ],
          ),
          new Padding(padding: const EdgeInsets.only(top: 8)),
          new Row(
            children: [
            new Padding(padding: const EdgeInsets.symmetric(horizontal: 8)),  
            new Text("View all 4 comments",style: TextStyle(fontSize: 20,color: Colors.grey[700],fontWeight: FontWeight.bold),),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: new Icon(Icons.add,size: 35,color: Colors.grey[900],),
        backgroundColor: Colors.white,
        onPressed: (){}
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: new BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.grey[900],
        child: new SizedBox(
          height: 55,
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            new Padding(padding: const EdgeInsets.symmetric(horizontal: 10)),
            new GestureDetector(
              child: new Icon(Icons.home,color: Colors.white,size: 30,),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>HomeScreen()));
              },
              ),
            new Padding(padding: const EdgeInsets.symmetric(horizontal: 30)),
            new Icon(Icons.search,color: Colors.white,size: 30,),
            new Padding(padding: const EdgeInsets.symmetric(horizontal: 70)),
            new Icon(Icons.favorite_border,size: 30,color: Colors.white,),
            new Padding(padding: const EdgeInsets.symmetric(horizontal: 25)),
            new GestureDetector(
              child: new Icon(Icons.face,color: Colors.white,size: 30,),
              onTap:(){
                Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>ProfilePage()));
              },
              ),
          ],
        ),
        )
      ),
    );
  }
}