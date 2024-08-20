import 'package:flutter/material.dart';
import 'package:to_do_list/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final TextEditingController controller;

  const DialogBox(
      {super.key,
      required this.onSave,
      required this.onCancel,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    controller.text = '';

    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Confirm", onPressed: onSave),
                SizedBox(width: 10),
                MyButton(text: "Cancel", onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
