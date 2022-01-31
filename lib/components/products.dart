import 'package:flutter/material.dart';
import 'package:e_commerce_app_1/pages/productDetails.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var product_list =[
      {
        "name":"Blazer",
        "picture":"images/products/blazer1.jpeg",
        "old price": 120,
        "price":80,
      },
      {
        "name":"Red Dress",
        "picture":"images/products/dress1.jpeg",
        "old price": 100,
        "price":50,
      },
      {
        "name":"Pant",
        "picture":"images/products/pants1.jpg",
        "old price": 30,
        "price":20,
      },
      {
        "name":"Skirt",
        "picture":"images/products/skt1.jpeg",
        "old price": 150,
        "price":120,
      },
      {
        "name":"Hill",
        "picture":"images/products/hills1.jpeg",
        "old price": 150,
        "price":120,
      },
      {
        "name":"Shoe",
        "picture":"images/products/shoe1.jpg",
        "old price": 100,
        "price":70,
      },
    ];
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder:(BuildContext context,int index){
          return Container(
            padding: EdgeInsets.all(6),
            child: SingleProd(
              prodName: product_list[index]["name"],
              prodPicture: product_list[index]["picture"],
              prodOldPrice: product_list[index]["old price"],
              prodPrice: product_list[index]["price"],
            ),
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
      child: Container(
        //tag: prodName,
        child: Material(
          elevation: 1,
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
                padding: EdgeInsets.fromLTRB(15, 3, 15, 3),
                color: Colors.white,
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

