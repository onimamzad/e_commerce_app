import 'package:e_commerce_app_1/db/users.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


enum Status{
  Uninitialized,
  Authenticated,
  Authenticating ,
  UnAuthenticated,
}

class UserProvider with ChangeNotifier{
  FirebaseAuth  _auth;
  User _user;
  User get user=> _user;
  Status _status =Status.Uninitialized;
  Status get status =>_status;
  UserServices _userServices=UserServices();


  UserProvider.initialize(): _auth= FirebaseAuth.instance{
    _auth.authStateChanges().listen(_onStateChange);
  }

  Future<bool> signIn (String email,String password)async{
    try{
      _status=Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    }
    catch(e){
      _status=Status.UnAuthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> signUp (String name, String email,String password)async{
    try{
      _status=Status.Authenticating;
      notifyListeners();
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
      .then((user) {
        Map <String,dynamic> values={
          'name':name,
          'email':email,
          'userId':user.user.uid,
        };
        _userServices.createUser(values);
      });
      return true;
    }
    catch(e){
      _status=Status.UnAuthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }


  Future signOut()async{
    await _auth.signOut();
    _status=Status.UnAuthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }




  Future<void> _onStateChange(User user)async {
    if (user==null){
      _status=Status.Authenticated;
    }
    else{
      _user=user;
      _status=Status.Authenticated;
    }
    notifyListeners();
  }
}



