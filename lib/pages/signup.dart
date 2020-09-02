import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:za/db/users.dart';

import 'home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  UserServices _userServices= UserServices();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmPasswordTextController =
      TextEditingController();
  String gender;
  String groupvalue = "male";
  SharedPreferences preferences;
  bool loading = false;
  bool hidepass = true;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/w4.jpeg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.8),
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset("images/logo.png"),
            width: 150.0,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Center(
              child: Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              controller: _nameTextController,
                              decoration: InputDecoration(
                                hintText: "Full Name",
                                icon: Icon(Icons.person_outline),
                                border: InputBorder.none,
                              ),
                              // ignore: missing_return
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "The Name should not be empty";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: new Container(
                          color: Colors.white.withOpacity(0.8),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    "male",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  trailing: Radio(
                                      value: "male",
                                      groupValue: groupvalue,
                                      onChanged: (e) => valueChanged(e)),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    "female",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  trailing: Radio(
                                      value: "female",
                                      groupValue: groupvalue,
                                      onChanged: (e) => valueChanged(e)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                                controller: _emailTextController,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  icon: Icon(Icons.alternate_email),
                                  border: InputBorder.none,
                                ),
                                // ignore: missing_return
                                validator: (value) {
                                  // ignore: missing_return, missing_return
                                  if (value.isEmpty) {
                                    Pattern pattern =
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regex = new RegExp(pattern);
                                    if (!regex.hasMatch(value))
                                      return 'Please make sure your email address is valid';
                                    else
                                      return null;
                                  }
                                }),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ListTile(
                              title: TextFormField(
                                controller: _passwordTextController,
                                obscureText: hidepass,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  icon: Icon(Icons.lock_outline),
                                  border: InputBorder.none,
                                ),
                                // ignore: missing_return
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The password should not be empty";
                                  } else if (value.length < 6) {
                                    return "Password must be at least 6 characters";
                                  }
                                  return null;
                                },
                              ),
                              trailing: IconButton(icon: Icon(Icons.remove_red_eye, ), onPressed: (){
                                setState(() {
                                  hidepass= false;
                                });
                              }),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ListTile(
                              title: TextFormField(
                                controller: _confirmPasswordTextController,
                                obscureText: hidepass,
                                decoration: InputDecoration(
                                  hintText: "Confirm Password",
                                  icon: Icon(Icons.lock_outline),
                                  border: InputBorder.none,
                                ),
                                // ignore: missing_return
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The password should not be empty";
                                  } else if (value.length < 6) {
                                    return "Password must be at least 6 characters";
                                  } else if (_passwordTextController.text!= value) {
                                    return "Passwords do not match!";
                                  }
                                  return null;
                                },
                              ),
                              trailing: IconButton(icon: Icon(Icons.remove_red_eye, ), onPressed: (){
                                setState(() {
                                  hidepass= false;
                                });
                              }),
                            ),
                          ),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.cyan,
                            elevation: 0.0,
                            child: MaterialButton(
                              onPressed: () async{
                                validateForm();
                              },
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text(
                                "Sign up",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Login!",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.cyan),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          Visibility(
              visible: loading ?? true,
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white.withOpacity(0.9),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[800]),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  valueChanged(e) {
    setState(() {
      if (e == "male") {
        groupvalue = e;
        gender= e;
      } else if (e == "female") {
        groupvalue = e;
        gender= e;
      }
    });
  }

Future validateForm() async{
    FormState formState = _formKey.currentState;

    if(formState.validate()){
      formState.reset();
      FirebaseUser user = await firebaseAuth.currentUser();
      if(user== null){
        firebaseAuth.createUserWithEmailAndPassword(
            email: _emailTextController.text,
            password: _passwordTextController.text).then((authResult) async =>{

            _userServices.createUser(

                {
              "username":_nameTextController.text,
              "email": _emailTextController.text,
              "userId": (await FirebaseAuth.instance.currentUser()).uid,
              "gender": gender,

            })
        }).catchError((err)=>{print(err.toString())});
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));

      }
    }
  }

// This is the missing Code

}
