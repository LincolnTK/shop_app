import 'package:flutter/material.dart';

import 'package:za/pages/home.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;

  ProductDetails({
    this.product_detail_name,
    this.product_detail_new_price,
    this.product_detail_old_price,
    this.product_detail_picture,
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.05,
        backgroundColor: Colors.cyan,
        title: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new HomePage()));
            },
            child: Text('ShopApp')),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
          new IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {})
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: Image.asset(widget.product_detail_picture),
                ),
                footer: new Container(
                  color: Colors.white60,
                  child: ListTile(
                    leading: new Text(
                      widget.product_detail_name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    title: new Row(
                      children: <Widget>[
                        Expanded(
                            child: new Text(
                          "\$${widget.product_detail_old_price}",
                          style: TextStyle(
                              color: Colors.red[300],
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.lineThrough),
                        )),
                        Expanded(
                            child: new Text(
                          "\$${widget.product_detail_new_price}",
                          style: TextStyle(
                              color: Colors.blue[800],
                              fontWeight: FontWeight.w800),
                        ))
                      ],
                    ),
                  ),
                )),
          ),

          //========== the first buttons =============
          Row(
            children: <Widget>[
              //=========== the size button ============
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: new Text("Size"),
                          content: new Text("Choose the size"),
                          actions: <Widget>[
                            new MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: new Text("close"),
                            )
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.blue[800],
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text("Size"),
                    ),
                    Expanded(
                      child: new Icon(Icons.arrow_drop_down),
                    )
                  ],
                ),
              )),

              //=========== the color button ============

              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: new Text("Color"),
                          content: new Text("Choose the color"),
                          actions: <Widget>[
                            new MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: new Text("close"),
                            )
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.blue[800],
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text("Color"),
                    ),
                    Expanded(
                      child: new Icon(Icons.arrow_drop_down),
                    )
                  ],
                ),
              )),

              //=========== the Quantity button ============

              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: new Text("Quantity"),
                          content: new Text("Choose the quantity"),
                          actions: <Widget>[
                            new MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: new Text("close"),
                            )
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.blue[800],
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text("Qty"),
                    ),
                    Expanded(
                      child: new Icon(Icons.arrow_drop_down),
                    )
                  ],
                ),
              )),
            ],
          ),

          //========== the Second buttons =============

          Row(
            children: <Widget>[
              //=========== the Buy button ============
              Expanded(
                  child: MaterialButton(
                onPressed: () {},
                color: Colors.cyan,
                textColor: Colors.white,
                elevation: 0.2,
                child: new Text("Buy now"),
              )),

              //=========== the add to cart button ============

              new IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  color: Colors.cyan,
                  onPressed: () {}),

              //=========== the like button ============

              new IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Colors.cyan,
                  onPressed: () {})
            ],
          ),
          Divider(
            color: Colors.cyan,
          ),
          new ListTile(
            title: new Text("Product details"),
            subtitle: new Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
          ),

          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product name",
                  style: TextStyle(
                    color: Colors.blue[800],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(widget.product_detail_name),
              )
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product brand",
                  style: TextStyle(
                    color: Colors.blue[800],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("brand X"),
              )
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product condition",
                  style: TextStyle(
                    color: Colors.blue[800],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("new"),
              )
            ],
          ),
          Divider(
            color: Colors.blue[800],
          ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("Similar products"),
        ),
        // =================Similar_products section=================

          Container(
            height: 360.0,
            child: Similar_products(),
          )
        ],
      ),
    );
  }
}
class Similar_products extends StatefulWidget {
  @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {
  @override
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
          return Similar_Single_prod(
            product_name: product_list[index]['name'],
            product_picture: product_list[index]['picture'],
            product_old_price: product_list[index]['old_price'],
            product_price: product_list[index]['price'],
          );
        });
  }
}

class Similar_Single_prod extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_old_price;
  final product_price;

  Similar_Single_prod({
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


