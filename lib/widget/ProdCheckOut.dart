import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ophone/controllers/CartController.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final CartController getCartList = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    if (getCartList.cartList.isNotEmpty && getCartList.cartList.length != 0) {
      return Container(
        padding: EdgeInsets.only(right: 10),
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Obx(
                      () => ListTile(
                    title: Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: getCartList.calSum(),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: () {},
                  child: Text(
                    "CHECKOUT",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      shadows: [
                        Shadow(
                          blurRadius: 3.0,
                          color: Colors.black54,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        child: Center(
          child: Text(
            'Your Cart Is Empty',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      );
    }
  }
}
