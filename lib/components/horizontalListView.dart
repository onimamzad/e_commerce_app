import 'package:flutter/material.dart';

class HorizontalList  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(imageLocation: 'images/cats/tshirt.png',imageCaption: 'Shirt',),
          Category(imageLocation: 'images/cats/dress.png',imageCaption: 'Dress',),
          Category(imageLocation: 'images/cats/formal.png',imageCaption: 'Formal',),
          Category(imageLocation: 'images/cats/informal.png',imageCaption: 'Informal',),
          Category(imageLocation: 'images/cats/jeans.png',imageCaption: 'Jeans',),
          Category(imageLocation: 'images/cats/shoe.png',imageCaption: 'Shoe',),
          Category(imageLocation: 'images/cats/accessories.png',imageCaption: 'Accessories',),

        ],
      ),
    );
  }
}


class Category extends StatelessWidget {

  final String imageLocation;
  final String imageCaption ;


  Category({this.imageCaption,this.imageLocation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        child: InkWell(
          onTap: (){},
          child: Container(
            width: 80,
            child: ListTile(
              title: Image.asset(
                  imageLocation,
                  width: 50,
                  height: 50,
              ),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                    imageCaption,
                  style: TextStyle(
                    fontSize: 12
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

