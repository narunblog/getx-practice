import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Dialog extends StatelessWidget {
  const Dialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('show Dialog'),
      onPressed: () {
        Get.defaultDialog(
          title: 'Are you sure',
          content: Text('hello'),
          textCancel: 'No',
          textConfirm: 'Yes',
          //confirmTextColor: Colors.white,
          onConfirm: (() {
            print('confirm');
          }),
          onCancel: (() {
            print('cancel');
          }),
          //barrierDismissible: false,
          //true -> ダイアログの外を押した時にダイアログを閉じる, false->閉じない
        );
      },
    );
  }
}
