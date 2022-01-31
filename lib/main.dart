import 'package:e_commerce_app_1/pages/homePage.dart';
import 'package:e_commerce_app_1/pages/signUpPage.dart';
import 'package:e_commerce_app_1/pages/splash.dart';
import 'package:e_commerce_app_1/provider/userProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import "package:e_commerce_app_1/pages/loginPage.dart";
import 'package:provider/provider.dart';
import 'package:e_commerce_app_1/provider/userProvider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (_)=>UserProvider.initialize(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.red.shade900,
        ),
        debugShowCheckedModeBanner: false,
        home: ScreenController(),
      ),
    )
  );
}
class ScreenController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch (user.status){
      case Status.Uninitialized:
        return Splash();
      case Status.UnAuthenticated:
      case Status.Authenticating :
        return LoginPage();
      case Status.Authenticated:
        return HomePage();
      default: LoginPage();
    }
  }
}






