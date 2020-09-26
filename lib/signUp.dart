import 'package:flutter/material.dart';
import 'package:insta_clone_app/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();  

  String email;
  String password;

  Future <void> SignUp() async {
    if(fromKey.currentState.validate()){
      fromKey.currentState.save();
      try{
        await Firebase.initializeApp();
        FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>HomePage()));
      }
      catch(e){
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        padding: const EdgeInsets.all(10),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Text("New,",style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.bold),),
            new Row(
            children: [
              new Text("Sign-Up",style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.bold),),
              new Padding(padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10)),
              new CircleAvatar(
                backgroundColor: Colors.white,
                radius: 6,
              )
            ],
            ),
            new Padding(padding: const EdgeInsets.only(top: 15)),
            new Form(
              key: fromKey,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  new TextFormField(
                decoration: new InputDecoration(
                  labelText: "Enter E-Mail ID",
                  labelStyle: TextStyle(fontSize: 25,color: Colors.grey[700],fontWeight: FontWeight.bold),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (val)=>val.contains("@") ? null:"Enter Valid E-Mail ID" ,
                onSaved: (val)=>email=val,
              ),
              new Padding(padding: const EdgeInsets.only(top: 5)),
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: "Enter Password",
                  labelStyle: TextStyle(fontSize: 25,color: Colors.grey[700],fontWeight: FontWeight.bold),
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
                validator: (val)=>val.length<6 ? "Enter Longer Password" : null,
                onSaved: (val)=>password=val,
              ),
              new Padding(padding: const EdgeInsets.only(top:10)),
              new RaisedButton(
                child: new Text("Sign-Up",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                onPressed: SignUp,
                color: Colors.white,
                shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                ],
              )
              )
          ],
        ),
      ),
    );
  }
}