import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ophone/controllers/CartController.dart';
import 'package:ophone/controllers/GetX.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  final MyController getValueCount = Get.put(MyController());
  final CartController getCartList = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      ListView.builder(
        controller: ScrollController(),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: getCartList.cartList.length,
        itemBuilder: (context, index) {
          if (getCartList.cartList.length != 0) {
            return Obx(
                  () => Card(
                elevation: 10,
                child: Container(
                  height: 200,
                  width: 500,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 15, top: 10),
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              getCartList.cartList[index]['name'],
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black54),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(
                                      () => Text(
                                    (getValueCount.calculateItemPrice()),
                                    style: TextStyle(
                                        color: Colors.red[700],
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    getCartList.itemRemove();
                                  },
                                  icon: Icon(
                                    Icons.delete_forever_outlined,
                                    color: Colors.black38,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 149,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network(
                              getCartList.cartList[index]['image'],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    getValueCount.decrementctr();
                                  },
                                  icon: Icon(
                                    Icons.remove_circle,
                                    size: 35,
                                    color: Colors.black38,
                                  ),
                                ),
                                Obx(
                                      () => Text(
                                    '${getValueCount.qty.toString()}',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    getValueCount.incrementctr();
                                  },
                                  icon: Icon(Icons.add_circle,
                                      size: 35, color: Colors.black38),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Obx(
                  () => Container(
                child: Center(
                  child: Text(
                    'Your Cart Is Empty',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            );
          }
        },
      ),
      SizedBox(
        height: 92,
      ),
    ]);
  }
}
