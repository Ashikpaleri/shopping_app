import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/CartController.dart';
import 'package:ophone/controllers/GetX.dart';
import 'package:ophone/widget/ProdCheckOut.dart';

import 'package:ophone/widget/CartProducts.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final MyController getValueCount = Get.put(MyController());
  final CartController getCartList = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(left: 100),
            child: getCartList.cartValue(),
          ),
        ),
        body: CartProducts(),
        floatingActionButton: CheckOut(),
      ),
    );
  }
}
