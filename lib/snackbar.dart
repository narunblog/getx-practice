import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getxpractic/main.dart';

class SnackBar extends StatelessWidget {
  const SnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text('show SnackBar'),
        onPressed: () {
          Get.snackbar(
            'Success',
            'This is a snackbar',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.blue,
            colorText: Colors.red,
            borderRadius: 10,
            margin: EdgeInsets.all(10),
            icon: Icon(Icons.arrow_back),
            mainButton: TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 15),
                ),
                onPressed: null,
                child: const Text('Disabled')),
            padding: EdgeInsets.all(10),
          );
        });
  }
}
