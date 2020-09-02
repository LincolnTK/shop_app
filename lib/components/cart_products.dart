import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_cart = [
    {
      "name": "Hills 1",
      "picture": "images/products/hills1.jpeg",
      "price": 65,
      "size": "6",
      "color": "Black",
      "quantity": 1,
    },
    {
      "name": "Pants 2",
      "picture": "images/products/pants2.jpeg",
      "price": 65,
      "size": "M",
      "color": "blue",
      "quantity": 3,
    },
    {
      "name": "Skirt",
      "picture": "images/products/skt1.jpeg",
      "price": 65,
      "size": "S",
      "color": "red",
      "quantity": 3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: Products_on_cart.length,
        itemBuilder: (context, index) {
          return new Single_cart_products(
            cart_product_name: Products_on_cart[index]["name"],
            cart_product_size: Products_on_cart[index]["size"],
            cart_product_color: Products_on_cart[index]["color"],
            cart_product_price: Products_on_cart[index]["price"],
            cart_product_picture: Products_on_cart[index]["picture"],
            cart_product_quantity: Products_on_cart[index]["quantity"],
          );
        });
  }
}

class Single_cart_products extends StatelessWidget {
  final cart_product_name;
  final cart_product_picture;
  final cart_product_price;
  final cart_product_size;
  final cart_product_color;
  final cart_product_quantity;

  Single_cart_products({
    this.cart_product_name,
    this.cart_product_picture,
    this.cart_product_price,
    this.cart_product_size,
    this.cart_product_color,
    this.cart_product_quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //===========LEADING SECTION=================
        leading: new Image.asset(
          cart_product_picture,
          width: 80.0,
          height: 80.0,
        ),

        // =================TITLE SECTION=================
        title: new Text(cart_product_name),

        //================= SUBTITLE SECTION=================
        subtitle: new Column(
          children: <Widget>[
            // ==================ROW INSIDE THE COLUMN=================
            new Row(
              children: <Widget>[
                // =================size of the product=================
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(
                    cart_product_size,
                    style: TextStyle(color: Colors.cyan),
                  ),
                ),

                // =================product color=================
                new Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: new Text("Color:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(
                    cart_product_color,
                    style: TextStyle(color: Colors.cyan),
                  ),
                ),
              ],
            ),

            // =================Product price=================

            new Container(
              alignment: Alignment.bottomLeft,
              child: new Text(
                "\$${cart_product_price}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.cyan,
                ),
              ),
            ),
          ],
        ),
        trailing: new Column(
          children: <Widget>[
            Expanded(
              child:  new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){}),),
      Expanded(  child: new Text("$cart_product_quantity"),),
        Expanded(  child:new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){}),
   )],
        ),
      ),
    );
  }

}
