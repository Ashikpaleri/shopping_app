import 'package:get/get.dart';

import 'CartController.dart';

class MyController extends GetxController {
  var qty = 0.obs;
  var count = 0.obs;

  incrementctr() {
    qty.value++;
    count.value++;
  }

  void decrementctr() {
    if (qty.value != 0) {
      qty.value--;
      count.value--;
    }
  }

  calculateItemPrice() {
    final CartController getCartList = Get.put(CartController());

    int index = 0;
    var total = 'OMR ${(getCartList.cartList[index]['price']) * (count.value)}';
    return total;
  }
}
