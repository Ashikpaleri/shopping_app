import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:ophone/controllers/GetX.dart';
import 'package:ophone/pages/CartPage.dart';

class CartController extends GetxController {
  List cartList = [].obs;
  var cartCount = 0.obs;
  var cartSum = 0.obs;
  var cardIndex = 0.obs;

  itemRemove() {
    int index = cardIndex.toInt();
    cartList.removeAt(index);
  }

  addToCart() {
    cartList.add({
      "name": "APPLE iPhone 12 Pro (Pacific Blue, 128 GB",
      "price": 90.00,
      'image': 'https://m.media-amazon.com/images/I/71DVgBTdyLL._SX679_.jpg',
    });
  }

  goToCartButton(BuildContext context) {
    return Container(
      decoration:
      BoxDecoration(border: Border.all(color: Colors.redAccent, width: 2)),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 20),
      padding: EdgeInsets.only(),
      child: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CartPage(),
          ),
        ),
        child: Text(
          'GO TO CART',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            shadows: [
              Shadow(
                blurRadius: 3.0,
                color: Colors.yellow,
                offset: Offset(3.0, 3.0),
              ),
            ],
          ),
        ),
        elevation: 10,
      ),
    );
  }

  addCartButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 30),
      padding: EdgeInsets.only(),
      child: FloatingActionButton(
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(),
        onPressed: () {
          addToCart();
        },
        child: Text(
          'ADD TO CART',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        elevation: 10,
      ),
    );
  }

  cartValue() {
    final CartController getCartList = Get.put(CartController());

    int cartCount = getCartList.cartList.length;
    return Text(
      'My Cart ($cartCount)',
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  calSum() {
    final MyController getValueCount = Get.put(MyController());

    return Text(
      '${getValueCount.calculateItemPrice()}',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black54,
      ),
    );
  }
}
