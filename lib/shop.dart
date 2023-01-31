import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getxpractic/cart.dart';
import 'package:getxpractic/controller/homeController.dart';

class Shop extends StatelessWidget {
  Shop({super.key});

  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('shop'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Text(Get.arguments['key']),
              //Text(Get.parameters['slag']!),
              //Text('Shop Page'),
              ElevatedButton(
                onPressed: (() {
                  Get.off(Cart());
                  Get.offNamed('/cart');
                  //Get.offAllNamed('/cart');
                  //Get.offAll(Cart());
                }),
                child: Text('Go to cart'),
              ),
              ElevatedButton(
                onPressed: (() {
                  Get.back(result: 'send value from next screen');
                }),
                child: Text('back to main'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
