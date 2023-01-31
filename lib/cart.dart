import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxpractic/controller/homeController.dart';

class Cart extends GetWidget<HomeController> {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cart page'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Text(controller.status.value),
          ElevatedButton(
              onPressed: (() {
                Get.back();
              }),
              child: Text('return back'))
        ],
      )),
    );
  }
}
