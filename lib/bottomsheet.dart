import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class BottomSheet extends StatelessWidget {
  const BottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('show bottomsheet'),
      onPressed: () {
        Get.bottomSheet(
            Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularProgressIndicator(),
                  Icon(
                    Icons.message,
                    size: 50,
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.amber,
            //isDismissible: false,
            //true -> ボトムシート以外の部分をタップした時に非表示にする false -> 非表示にできない
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ));
      },
    );
  }
}
