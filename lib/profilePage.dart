import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone_app/editProfilePage.dart';
import 'package:insta_clone_app/main.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final User users= FirebaseAuth.instance.currentUser;

  Future <void> SignOut() async {
    await Firebase.initializeApp();
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>HomePage()));
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Your Profile",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: new StreamBuilder<DocumentSnapshot>
      (
        stream: FirebaseFirestore.instance.collection("users").doc(users.uid).snapshots(),
        builder: ( BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
          if(!snapshot.hasData) return new Center(child:new CircularProgressIndicator());

          return new Container(
            padding: const EdgeInsets.all(20),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new Padding(padding: const EdgeInsets.symmetric(horizontal: 200)),
                new CircleAvatar(
                  child: new Text("DP",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
                  backgroundColor: Colors.green[800],
                  radius: 30,
                ),
                new Padding(padding: const EdgeInsets.only(top: 5)),
                new Text(snapshot.data.data()["user name"],style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                new Padding(padding: const EdgeInsets.only(top: 10)),
                new Text(snapshot.data.data()["first name"]+snapshot.data.data()["last name"],style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                new Padding(padding: const EdgeInsets.only(top: 5)),
                new Text(snapshot.data.data()["bio"],style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,)),
                new Padding(padding: const EdgeInsets.only(top: 15)),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    new Column(
                      children: [
                        new Text(snapshot.data.data()["posts"].toString(),style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                        new Text("Posts",style: TextStyle(fontSize: 20,color: Colors.white),),
                      ],
                    ),
                    new Column(
                      children: [
                        new Text(snapshot.data.data()["followers"].toString(),style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                        new Text("Followers",style: TextStyle(fontSize: 20,color: Colors.white),),
                      ],
                    ),
                    new Column(
                      children: [
                        new Text(snapshot.data.data()["following"].toString(),style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                        new Text("Following",style: TextStyle(fontSize: 20,color: Colors.white),),
                      ],
                    ),
                  ],
                ),
                new Padding(padding: const EdgeInsets.only(top: 10)),
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                    new RaisedButton(
                    child: new Text("Edit Profile",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>EditProfile()));
                    },
                    color: Colors.white,
                    shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  new Padding(padding: const EdgeInsets.only(top:5)),
                  new RaisedButton(
                    child: new Text("Settings",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                    onPressed: (){},
                    color: Colors.white,
                    shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  new Padding(padding: const EdgeInsets.only(top:5)),
                  new RaisedButton(
                    child: new Text("Sign-Out",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                    onPressed: SignOut,
                    color: Colors.red[800],
                    shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  ],
                )
              ],
            ),
          );
        }
      ),
    );
  }
}