import 'package:flutter/material.dart';


class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {

  var productOnCurt = [
    {
      "name":"Pant",
      "picture":"images/products/pants1.jpg",
      "price":20,
      "size": "M",
      "color":"Red",
      "quantity":1,
    },
    {
      "name":"Skirt",
      "picture":"images/products/skt1.jpeg",
      "price":120,
      "size": "XL",
      "color":"Yellow",
      "quantity":2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: productOnCurt.length,
        itemBuilder: (context,index){
          return SingleCartProduct(
            cartProdColor: productOnCurt[index]["color"],
            cartProdName: productOnCurt[index]["name"],
            cartProdPicture: productOnCurt[index]["picture"],
            cartProdPrice: productOnCurt[index]["price"],
            cartProdQuantity: productOnCurt[index]["quantity"],
            cartProdSize: productOnCurt[index]["size"],
          );
        },
    );
  }
}



class SingleCartProduct extends StatelessWidget {

  final cartProdName;
  final cartProdPicture ;
  final cartProdPrice ;
  final cartProdSize;
  final cartProdColor ;
  final cartProdQuantity ;

  SingleCartProduct({this.cartProdColor,this.cartProdName,this.cartProdPicture,this.cartProdPrice,this.cartProdQuantity,this.cartProdSize});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //========Leading image==========
        leading: Image.asset(
            cartProdPicture,
        ),
        title: Padding(
          //===========Title section===============
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(cartProdName,style: TextStyle(color:Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
        ),
        subtitle: Column(
          //===========Subtitle section=============
          children: <Widget>[
            //========For Size and Color======
            Row(
              children: <Widget>[
                //==========Showing Size=================
                Container(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Size:"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            cartProdSize,
                            style: TextStyle(
                              color: Colors.red,
                            ),
                        ),
                      ),
                    ],
                  ),
                ),

            //==========Showing Color==============
                Container(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Color:"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(cartProdColor,style: TextStyle(
                          color: Colors.red,
                        ),),
                      ),
                    ],
                  ),
                ),

              ],
            ),
            //========This section is for Product Price======
            Container(
              padding: EdgeInsets.only(left: 8),
              alignment: Alignment.topLeft,
              child: Text("\$$cartProdPrice",style:TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 14,)),
            ),

          ],
        ),
        trailing: Container(
          padding: EdgeInsets.only(top: 10),
          width: 80,
          child: Row(
            children: <Widget>[
              InkWell(
                onTap: (){
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5.0),
                        topLeft: Radius.circular(5.0)),
                    color: Colors.black.withOpacity(0.7),
                  ),
                  child: Center(
                    child: Icon(Icons.remove,color: Colors.white),
                  ),
                  width: 25,
                  height: 25,
                ),
              ),
              Container(
                width: 25,
                height: 25,
                color: Colors.white,
                child: Center(
                  child: Text(cartProdQuantity.toString()),
                ),
              ),
              InkWell(
                onTap: (){},
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5.0),
                        topRight: Radius.circular(5.0)),
                    color: Colors.black.withOpacity(0.7),
                  ),
                  child: Center(
                    child: Icon(Icons.add, color: Colors.white,),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



