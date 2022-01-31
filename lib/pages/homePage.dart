import 'package:e_commerce_app_1/pages/loginPage.dart';
import 'package:e_commerce_app_1/provider/userProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:e_commerce_app_1/components/products.dart';
import 'package:e_commerce_app_1/pages/cart.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce_app_1/components/horizontalListView.dart';
import 'package:e_commerce_app_1/components/formInputTextField.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _auth=FirebaseAuth.instance;
  TextEditingController searchController =TextEditingController();

  void signOut(){
    _auth.signOut();
    Navigator.push(context, MaterialPageRoute(
      builder: (context)=> LoginPage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    Widget imageCarousel = new Container (
      height: 200,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/m1.jpeg'),
          AssetImage('images/c1.jpg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/w1.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg'),
        ],
        autoplay: false,
        animationCurve: Curves.fastLinearToSlowEaseIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 8,
        dotBgColor: Colors.transparent,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.1,
        title: Padding(
          padding: const EdgeInsets.all(0.0),
          child:  Padding(
            padding:  EdgeInsets.all(18),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Search...',
                    border: InputBorder.none,
                    //icon: Icon(Icons.search),
                  ),
                  controller: searchController,
                ),
              ),
            ),
          ),
        ),
        actions: <Widget>[

          IconButton(
            icon: Icon(
              Icons.search ,
              color: Colors.white,
            ),
            onPressed: (){
            },
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart ,
              color: Colors.white,
            ),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=>Cart(),
              ));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Amzad Hossain'),
              accountEmail: Text('onimamzad@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person,color: Colors.white,),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),

            //Body
            InkWell(
              onTap: (){
                user.signOut();
                Navigator.pop(context); 
              },
              child: ListTile(
                title: Text('Home Page/SignOut'),
                leading: Icon(Icons.home,color: Colors.red,),
              ),
            ),


            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person,color: Colors.red,),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My orders'),
                leading: Icon(Icons.shopping_basket,color: Colors.red,),
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>Cart(),
                ));
              },
              child: ListTile(
                title: Text('Shopping Cart'),
                leading: Icon(Icons.shopping_cart,color: Colors.red,),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Favorites '),
                leading: Icon(Icons.favorite,color: Colors.red,),
              ),
            ),

            Divider(),


            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings,),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help,),
              ),
            ),

          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          //imageCarousel,
          //imageCarousel,
            //Categories
//          Padding(
//            padding: EdgeInsets.all(8),
//            child: Text(
//                'Categories'
//            ),
//          ),
//
//          //Horizontal List View
//          HorizontalList(),
          //Recent Products text
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
                'Recent Products'
            ),
          ),
          //Grid view
          Flexible(
            child: Products(),
          ),



        ],
      ),



    );
  }
}