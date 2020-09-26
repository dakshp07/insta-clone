import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone_app/profilePage.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final User usersE = FirebaseAuth.instance.currentUser;
  final TextEditingController fName = new TextEditingController();
  final TextEditingController lName = new TextEditingController();
  final TextEditingController uName = new TextEditingController();
  final TextEditingController uBio = new TextEditingController();

  void editChanges() {
      if (fName.text.isNotEmpty && lName.text.isNotEmpty && uName.text.isNotEmpty && uBio.text.isNotEmpty){
        FirebaseFirestore.instance.collection("users").doc(usersE.uid).update(
        {
          "first name":fName.text,
          "last name" :lName.text,
          "user name":uName.text,
          "bio" : uBio.text,
        }
      );
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ProfilePage()));
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Edit Profile",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: new SingleChildScrollView(
          child: new Container(
          padding: const EdgeInsets.all(40),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Row(
                children: [
                new Column(
                  children: [
                    new Text("Something To",style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.bold),),
                    new Row(
                      children: [
                        new Text("Add New",style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.bold),),
                        new Padding(padding: const EdgeInsets.symmetric(horizontal: 5)),
                        new CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 6,
                )
                      ],
                    )
                  ],
                ),
                ],
              ),
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: "Change First Name",
                  labelStyle: TextStyle(fontSize: 25,color: Colors.grey[700],fontWeight: FontWeight.bold),
                ),
                keyboardType: TextInputType.text,
                controller: fName,
              ),
              new Padding(padding: const EdgeInsets.only(top: 5)),
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: "Change Last Name",
                  labelStyle: TextStyle(fontSize: 25,color: Colors.grey[700],fontWeight: FontWeight.bold),
                ),
                keyboardType: TextInputType.text,
                controller: lName,
              ),
              new Padding(padding: const EdgeInsets.only(top: 5)),
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: "Change User Name",
                  labelStyle: TextStyle(fontSize: 25,color: Colors.grey[700],fontWeight: FontWeight.bold),
                ),
                keyboardType: TextInputType.text,
                controller: uName,
              ),
              new Padding(padding: const EdgeInsets.only(top: 5)),
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: "Change Bio",
                  labelStyle: TextStyle(fontSize: 25,color: Colors.grey[700],fontWeight: FontWeight.bold),
                ),
                keyboardType: TextInputType.text,
                controller: uBio,
              ),
              new Padding(padding: const EdgeInsets.only(top:10)),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  new RaisedButton(
                  child: new Text("Submit Changes",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                  onPressed: editChanges,
                  color: Colors.white,
                  shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}