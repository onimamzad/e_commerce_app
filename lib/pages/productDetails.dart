import 'package:flutter/material.dart';
import 'package:e_commerce_app_1/components/products.dart';
import 'package:e_commerce_app_1/main.dart';
import 'package:e_commerce_app_1/pages/homePage.dart';

class ProductDetails extends StatefulWidget {

  final productDetailName ;
  final productDetailPrice ;
  final productDetailOldPrice ;
  final productDetailPicture ;

  ProductDetails({this.productDetailName,this.productDetailOldPrice,this.productDetailPrice,this.productDetailPicture});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Comment
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.1,
        title: InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context)=> HomePage(),
            ) );
          },
            child: Text('Fashapp'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search ,
              color: Colors.white,
            ),
            onPressed: (){},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          //===Image===
          Container(
            height: 300,
            color: Colors.white,
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                        widget.productDetailName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                            "\$${widget.productDetailOldPrice}",
                          style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                            "\$${widget.productDetailPrice}",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                        ),

                      ),

                    ],
                  ),
                ),
              ),
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.productDetailPicture),
              ),
            ),
            //child: Colors.red,
          ),
          //=======The first Buttons=====
          Row(
            children: <Widget>[
              //===========The size button============
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text("Size"),
                            content: Text("Choose the size"),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                                child: Text("Close"),
                              ),
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Size',
                        ),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
              //====The color Button================
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        title: Text("Color"),
                        content: Text("Choose a color"),
                        actions: <Widget>[
                          MaterialButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: Text("Close"),
                          ),
                        ],
                      );
                    });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Color',
                        ),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
              //========The quantity Button =============
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(context:context,builder: (context){
                      return AlertDialog(
                        title: Text("Quantity"),
                        content: Text("Select Quantity"),
                        actions: <Widget>[
                          MaterialButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: Text("Close"),
                          ),
                        ],
                      );
                    });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Qty',
                        ),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
              //
            ],
          ),
          //The Buy now button
          Row(
            children: <Widget>[
              //===========The Buy now button button============
              Expanded(
                child: MaterialButton(
                  onPressed: (){},
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: Text(
                    'Buy Now',
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.add_shopping_cart),
                color: Colors.red,
                onPressed: (){},
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.red,
                onPressed: (){},
              ),


            ],
          ),
          Divider(),
          //Producr Details Text
          ListTile(
            title: Text("Product Details"),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took m Ipsum. "),
            ),
          ),
          Divider(),
          //Product Name,Brand,Condition
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text(
                  "Product Name",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(widget.productDetailName),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text(
                  "Product Brand",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),

              //Remember to add Brand
              Padding(
                padding: EdgeInsets.all(5),
                child: Text("Brand X"),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text(
                  "Product Condition",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              //Remember to add condition
              Padding(
                padding: EdgeInsets.all(5),
                child: Text("Condition X"),
              ),
            ],
          ),
          Divider(),
          //======Similar Products=======
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
                'Similar Products'
            ),
          ),
          //Grid view
          Container(
            height: 320,
            child: SimilarProducts(),
          ),
        ],
      ),
    );
  }
}

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {

  var product_list =[
    {
      "name":"Shoe",
      "picture":"images/products/shoe1.jpg",
      "old price": 100,
      "price":70,
    },
    {
      "name":"Hill",
      "picture":"images/products/hills1.jpeg",
      "old price": 150,
      "price":120,
    },
    {
      "name":"Red Dress",
      "picture":"images/products/dress1.jpeg",
      "old price": 100,
      "price":50,
    },

    {
      "name":"Skirt",
      "picture":"images/products/skt1.jpeg",
      "old price": 150,
      "price":120,
    },

  ];

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder:(BuildContext context,int index){
        return SingleProd(
          prodName: product_list[index]["name"],
          prodPicture: product_list[index]["picture"],
          prodOldPrice: product_list[index]["old price"],
          prodPrice: product_list[index]["price"],
        ) ;
      } ,
      itemCount: product_list.length,
    );
  }
}


class SingleProd extends StatelessWidget {

  SingleProd({this.prodName,this.prodPicture,this.prodPrice,this.prodOldPrice});

  final prodName;
  final prodPicture ;
  final prodOldPrice;
  final prodPrice ;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prodName,
        child: Material(
          child: InkWell(
            onTap:()=> Navigator.of(context).push(MaterialPageRoute(
              builder: (context)=> ProductDetails(
                //passing value to product details page
                productDetailName: prodName,
                productDetailPicture: prodPicture,
                productDetailOldPrice: prodOldPrice,
                productDetailPrice: prodPrice,
              ),
            )),
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        prodName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      "\$$prodPrice",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              child: Image.asset(prodPicture,fit: BoxFit.cover,),
            ),
          ),
        ),
      ),
    );
  }
}

