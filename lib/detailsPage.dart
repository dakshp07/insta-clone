import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone_app/homeScreen.dart';

class DetailsPage extends StatefulWidget {

  final User users;
  DetailsPage({this.users});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  final TextEditingController fName = new TextEditingController();
  final TextEditingController lName = new TextEditingController();
  final TextEditingController uName = new TextEditingController();
  int followers=0;
  int following=0;
  int posts=0;
  String bio="";

  void Details(){
    if(fName.text.isNotEmpty && lName.text.isNotEmpty && uName.text.isNotEmpty){
      FirebaseFirestore.instance.collection("users").doc(widget.users.uid).set
      (
        {
          "first name":fName.text,
          "last name" :lName.text,
          "user name":uName.text,
          "followers" : followers,
          "following" : following, 
          "posts" : posts,
          "bio" : bio,
        }
      );
      fName.clear();
      lName.clear();
      uName.clear();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>HomeScreen(cuuser: widget.users,)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Fill All The Details",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: new Container(
        padding: const EdgeInsets.all(10),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Row(
              children: [
                new Text("Welcome",style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.bold),),
              new Padding(padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10)),
              new CircleAvatar(
                backgroundColor: Colors.white,
                radius: 6,
              )
              ],
            ),
            new TextFormField(
              decoration: new InputDecoration(
                labelText: "Enter First Name",
                labelStyle: TextStyle(fontSize: 25,color: Colors.grey[700],fontWeight: FontWeight.bold),
              ),
              keyboardType: TextInputType.text,
              controller: fName,
            ),
            new Padding(padding: const EdgeInsets.only(top: 5)),
            new TextFormField(
              decoration: new InputDecoration(
                labelText: "Enter Last Name",
                labelStyle: TextStyle(fontSize: 25,color: Colors.grey[700],fontWeight: FontWeight.bold),
              ),
              keyboardType: TextInputType.text,
              controller: lName,
            ),
            new Padding(padding: const EdgeInsets.only(top: 5)),
            new TextFormField(
              decoration: new InputDecoration(
                labelText: "Enter User Name",
                labelStyle: TextStyle(fontSize: 25,color: Colors.grey[700],fontWeight: FontWeight.bold),
              ),
              keyboardType: TextInputType.text,
              controller: uName,
            ),
            new Padding(padding: const EdgeInsets.only(top:10)),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                new RaisedButton(
                child: new Text("Let's Get Started",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                onPressed: Details,
                color: Colors.white,
                shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}