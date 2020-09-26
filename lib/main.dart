import 'package:flutter/material.dart';
import 'package:insta_clone_app/detailsPage.dart';
import 'package:insta_clone_app/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness: Brightness.dark,
      ),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();  

  String email;
  String password;

  Future <void> SignIn() async {
    if(fromKey.currentState.validate()){
      fromKey.currentState.save();
      try{
        await Firebase.initializeApp();
        FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        final User currentUser = FirebaseAuth.instance.currentUser;
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>DetailsPage(users: currentUser,)));
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
            new Text("Hello,",style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.bold),),
            new Row(
            children: [
              new Text("There",style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.bold),),
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
                child: new Text("Sign-In",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                onPressed: SignIn,
                color: Colors.white,
                shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                new Padding(padding: const EdgeInsets.only(top:5)),
                new RaisedButton(
                child: new Text("Sign-Up",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SignupPage()));
                },
                color: Colors.black,
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