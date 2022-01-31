import 'package:e_commerce_app_1/commons/common.dart';
import 'package:e_commerce_app_1/commons/loading.dart';
import 'package:e_commerce_app_1/main.dart';
import 'package:e_commerce_app_1/provider/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app_1/pages/homePage.dart';
import 'package:e_commerce_app_1/components/formInputTextField.dart';
import 'package:e_commerce_app_1/pages/signUpPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

// firebase_auth: ^0.6.6

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth= FirebaseAuth.instance;
  SharedPreferences preferences;
  bool loading =false;
  bool isLogedIn=false;
  final _key  =GlobalKey<ScaffoldState>(); 

  //For the forms
  final _formKey= GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    //isSignedIn();
  }

  void isSignedIn()async{

      setState(() {
        loading=true ;
      });
      if(isLogedIn){
        print("user signed in");
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context)=>HomePage(),
        ));

        setState(() {
          loading=false;
        });
      }
      else{
        print("User not signed In");
        setState(() {
          loading=false;
        });
      }
  }



  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      body: user.status==Status.Authenticating?Loading(): Stack(
        children: <Widget>[
          Image.asset(
              "images/banner.jpg",
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
//todo add logo here
        //========Logo image===========
          Padding(
            padding: const EdgeInsets.fromLTRB(130, 40, 0, 0),
            child: Container(
              alignment: Alignment.center,
              child: Image.asset("images/logo.png"),
              width: 150,
              height: 150,
            ),
          ),
          //=====Green hue=============
          Container(
            color: Colors.green.withOpacity(0.2),
            width: double.infinity,
            height: double.infinity,
          ),
          //=====Sign In Form==========
          Padding(
            padding: const EdgeInsets.only(top:200.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    //todo Add validator functions
                    //This is a custom component
                    FormInputField(
                        editingController: _emailController,
                        hint: "Email",
                        boardType: TextInputType.emailAddress,
                        fieldIcon:Icons.email,
                    ),
                    FormInputField(
                      editingController: _passwordController,
                      fieldIcon: Icons.lock,
                      isObscure: true,
                      hint: "Password",
                      boardType: TextInputType.visiblePassword,
                    ),

                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.only(left:12.0),
                        child:MaterialButton(
                          //TODO add login logic
                          onPressed: ()async{
                            if (_formKey.currentState.validate()){
                             if (! await user.signIn(
                                 _emailController.text,
                                 _passwordController.text,)){
                                    _key.currentState.showSnackBar(SnackBar(
                                        content: Text('Sign In Failed '),
                                    ));
                             }
                             changeScreenReplacement(context, HomePage());
                            }
                          },
                          minWidth: MediaQuery.of(context).size.width,
                          child: Text("Log In",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                        ),
                      ),
                    ),
                  ),
                ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:InkWell(
                        onTap:(){ Navigator.push(context,MaterialPageRoute(
                          builder: (context)=>SignUpPage(),
                        ));},
                        child: Text(
                           "Sign Up here",
                          style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
              visible: loading ?? true,
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white.withOpacity(0.9),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  


}


