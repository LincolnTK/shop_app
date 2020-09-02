import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:za/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Blazer 2",
      "picture": "images/products/blazer2.jpeg",
      "old_price": 100,
      "price": 75,
    },
    {
      "name": "Dress 1",
      "picture": "images/products/dress1.jpeg",
      "old_price": 90,
      "price": 65,
    },
    {
      "name": "Dress 2",
      "picture": "images/products/dress2.jpeg",
      "old_price": 87,
      "price": 60,
    },
    {
      "name": "Hills 1",
      "picture": "images/products/hills1.jpeg",
      "old_price": 80,
      "price": 65,
    },
    {
      "name": "hills 2",
      "picture": "images/products/hills2.jpeg",
      "old_price": 87,
      "price": 70,
    },
    {
      "name": "Pants",
      "picture": "images/products/pants1.jpg",
      "old_price": 70,
      "price": 60,
    },
    {
      "name": "Pants 2",
      "picture": "images/products/pants2.jpeg",
      "old_price": 75,
      "price": 62,
    },
    {
      "name": "Skirt",
      "picture": "images/products/skt1.jpeg",
      "old_price": 60,
      "price": 50,
    },
    {
      "name": "Skirt 2",
      "picture": "images/products/skt2.jpeg",
      "old_price": 57,
      "price": 48,
    },
    {
      "name": "Shoe",
      "picture": "images/products/shoe1.jpg",
      "old_price": 87,
      "price": 60,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Single_prod(
              product_name: product_list[index]['name'],
              product_picture: product_list[index]['picture'],
              product_old_price: product_list[index]['old_price'],
              product_price: product_list[index]['price'],
            ),
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_old_price;
  final product_price;

  Single_prod({
    this.product_name,
    this.product_picture,
    this.product_old_price,
    this.product_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: product_name,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  // here we are passing the values of the product to the product details page
                  builder: (context) => new ProductDetails(
                        product_detail_name: product_name,
                        product_detail_new_price: product_price,
                        product_detail_old_price: product_old_price,
                        product_detail_picture: product_picture,
                      ))),
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: new Row(
                      children: <Widget>[
                        Expanded(
                          child: new Text(
                            product_name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17.0),
                          ),
                        ),
                        new Text(
                          "\$$product_old_price",
                          style: TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.lineThrough),
                        ),
                        new Text(
                          "\$$product_price",
                          style: TextStyle(
                              color: Colors.blue[800],
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  child: Image.asset(
                    product_picture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
