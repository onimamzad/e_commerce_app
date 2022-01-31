import 'package:e_commerce_app_1/commons/common.dart';
import 'package:e_commerce_app_1/commons/loading.dart';
import 'package:e_commerce_app_1/db/auth.dart';
import 'package:e_commerce_app_1/pages/homePage.dart';
import 'package:e_commerce_app_1/pages/loginPage.dart';
import 'package:e_commerce_app_1/provider/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_commerce_app_1/components/formInputTextField.dart';
import 'package:e_commerce_app_1/db/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  UserServices _userServices = UserServices();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordEditingController = TextEditingController();
  TextEditingController _nameControlController = TextEditingController();
 // String gender;
 // String groupValue = "male";
  bool loading = false;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Auth auth=Auth();
  final _key  =GlobalKey<ScaffoldState>();

  SharedPreferences preferences;


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      resizeToAvoidBottomInset: true,
      body:user.status==Status.Authenticating?Loading():  Stack(
        children: <Widget>[
          //Background Image
//          Image.asset(
//            "images/banner.jpg",
//            fit: BoxFit.fill,
//            width: double.infinity,
//            height: double.infinity,
//          ),
//todo add logo here
//          Padding(
//            padding: const EdgeInsets.fromLTRB(130, 40, 0, 0),
//            child: Container(
//              alignment: Alignment.center,
//              child: Image.asset("images/logo.png"),
//              width: 150,
//              height: 150,
//            ),
//          ),
          //=====For green hue=====
          Container(
            color: Colors.green.withOpacity(0.2),
            width: double.infinity,
            height: double.infinity,
          ),
          //=====Form========
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      //todo Add validator functions
                      //This is a custom component
                      FormInputField(
                        editingController: _nameControlController,
                        hint: "Name",
                        //isObscure: false,
                        //boardType: TextInputType.emailAddress,
                        fieldIcon: Icons.person,
                      ),
//                      Container(
//                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//                        color: Colors.white.withOpacity(0.5),
//                        child: Row(
//                          children: <Widget>[
//                            Expanded(
//                              child: ListTile(
//                                title: Text(
//                                  "Male",
//                                  textAlign: TextAlign.end,
//                                  style: TextStyle(
//                                    color: Colors.white,
//                                  ),
//                                ),
//                                trailing: Radio(
//                                  value: "Male",
//                                  groupValue: groupValue,
//                                  onChanged: (e) => valueChange(e),
//                                ),
//                              ),
//                            ),
//
//                            Expanded(
//                              child: ListTile(
//                                title: Text(
//                                  "Female",
//                                  textAlign: TextAlign.end,
//                                  style: TextStyle(
//                                    color: Colors.white,
//                                  ),
//                                ),
//                                trailing: Radio(
//                                  value: "Female",
//                                  groupValue: groupValue,
//                                  onChanged: (e) => valueChange(e),
//                                ),
//                              ),
//                            ),
//
//                          ],
//                        ),
//                      ),
                      FormInputField(
                        editingController: _emailController,
                        hint: "Email",
                        //isObscure: false,
                        boardType: TextInputType.emailAddress,
                        fieldIcon: Icons.email,
                      ),
                      FormInputField(
                        editingController: _passwordController,
                        fieldIcon: Icons.lock,
                        isObscure: true,
                        hint: "Password",
                        boardType: TextInputType.visiblePassword,
                      ),
//todo add obscure text
                      //todo Add show password functionality (Video 31 around 8:00)
                      FormInputField(
                        editingController: _confirmPasswordEditingController,
                        fieldIcon: Icons.lock,
                        isObscure: true,
                        hint: "Confirm password",
                        boardType: TextInputType.visiblePassword,
                      ),
                      //=========Register Button===========
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue.withOpacity(0.8),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: MaterialButton(
                              onPressed: ()async{
                                if (_formKey.currentState.validate()){
                                  if (! await user.signUp(
                                    _nameControlController.text,
                                    _emailController.text,
                                    _passwordController.text,)){
                                    _key.currentState.showSnackBar(SnackBar(
                                      content: Text('Sign Up Failed '),
                                    ));
                                    Navigator.push(context, MaterialPageRoute(builder:(context) =>HomePage() ));
                                  }
                                }
                              },
                              minWidth: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              child: Text("Register",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                          },
                          child: Text(
                            "All ready have an account? Sign Up here",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold,fontSize: 15),
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding:EdgeInsets.fromLTRB(14, 8, 14, 8),
                            child: MaterialButton(
                                onPressed: null,
                                child: Image.asset('images/fb.png',width: 60,),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                            child: MaterialButton(
                              onPressed: ()async{
                                User user =await   auth.googleSignIn();
                                Map<String ,dynamic> myMap ={
                                  'userId': user.uid,
                                  'name':user.displayName,
                                  'email':user.email,
                                  'photo':user.photoURL,
                                } ;

                                if(user!=null){
                                  _userServices.createUser(myMap);
                                }
                                changeScreenReplacement(context, HomePage());
                              },
                              child: Image.asset('images/google.png',width: 60,),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
          //=====Loading indicator=====
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
              )),
        ],
      ),
    );
  }
//  void valueChange(e) {
//    setState(() {
//      if (e == "Male") {
//        groupValue = e;
//        gender = e;
//      } else if (e == "Female") {
//        groupValue = e;
//        gender = e;
//      }
//    });
//  }

  Future validateForm() async {
    FormState formState = _formKey.currentState;
    //todo needs some more logic in create user methods.(Video 31 ,Git )
    firebaseAuth
        .createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text)
        .then((user) => {
      _userServices.createUser(
          {
            "username": _nameControlController.text,
            "email": _emailController.text,
            "userId": user.user.uid,
            //"gender": gender,
          }
      )
    }).catchError((err) => {print(err.toString())});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}



