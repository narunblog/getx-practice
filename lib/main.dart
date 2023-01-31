import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getxpractic/bindings/home_binding.dart';
import 'package:getxpractic/cart.dart';
import 'package:getxpractic/controller/homeController.dart';
import 'package:getxpractic/shop.dart';
import 'package:getxpractic/dialog.dart' as dl;
import 'package:getxpractic/bottomsheet.dart' as bs;
import 'package:getxpractic/snackbar.dart' as sb;

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //initialBinding: HomeBinding(),
      getPages: [
        GetPage(name: '/home', page: () => HomePage(), binding: HomeBinding()),
        GetPage(name: '/shop', page: () => Shop()),
        GetPage(name: '/cart', page: () => Cart()),
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: HomePage(),
      initialRoute: '/home',
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //HomeController homeController = Get.put(HomeController());

  HomeController homeController = Get.find<HomeController>();
  TextEditingController emailController = TextEditingController();

  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Getx Storage'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(hintText: 'email address'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (GetUtils.isEmail(emailController.text)) {
                          storage.write('email', emailController.text);
                          emailController.text = '';
                        } else {
                          Get.snackbar('encorrect email', 'Enter a valid email',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red,
                              colorText: Colors.white);
                        }
                      },
                      child: Text('submit')),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      homeController.updateEmail(storage.read('email'));
                    },
                    child: Text('view'),
                  ),
                  Obx((() {
                    return Text('Email address: ${homeController.email.value}');
                  }))
                ],
              ),
            ),
            GetBuilder<HomeController>(
                id: 'followers_widget',
                builder: (_) {
                  print('followers widget');
                  return Container(
                    child: Column(
                      children: [
                        //Text('${homeController.followers}'),
                        // ElevatedButton(
                        //     onPressed: () async {
                        //       homeController.updateStatus('offline');
                        //     },
                        //     child: const Text('logout')),
                      ],
                    ),
                  );
                }),
            // GetX<HomeController>(builder: (_) {
            //   print('status widget');
            //   return Container(
            //     child: Column(
            //       children: [
            //         Text('${homeController.status.value}'),
            //         ElevatedButton(
            //             onPressed: () async {
            //               homeController.updateStatus('offline');
            //             },
            //             child: const Text('logout')),
            //       ],
            //     ),
            //   );
            // }),
            // Obx(() {
            //   print('status widget');
            //   return Container(
            //     child: Column(
            //       children: [
            //         //Text('${homeController.status.value}'),
            //         // ElevatedButton(
            //         //     onPressed: () async {
            //         //       homeController.updateStatus('offline');
            //         //     },
            //         //     child: const Text('logout')),
            //       ],
            //     ),
            //   );
            // }),
            sb.SnackBar(),
            dl.Dialog(),
            bs.BottomSheet(),
            ElevatedButton(
                onPressed: (() async {
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) => Shop()));

                  // final data =
                  //     await Get.to(Shop(), arguments: {'key': 'value'});
                  // print(data);
                  Get.toNamed('/shop/value');
                }),
                child: const Text('Navigate to shop')),
          ]),
        ),
      ),
    );
  }
}
