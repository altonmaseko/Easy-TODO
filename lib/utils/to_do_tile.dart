import 'package:flutter/material.dart';

class ToDoTile extends StatefulWidget {
  final bool checked;
  final String toDoText;
  final Function(bool?)? onTick;

  final VoidCallback onDelete;

  const ToDoTile(
      {super.key,
      required this.checked,
      required this.toDoText,
      required this.onTick,
      required this.onDelete});

  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  @override
  Widget build(BuildContext context) {
    const double margin = 20;

    return Container(
      margin: const EdgeInsets.only(top: margin, right: margin, left: margin),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Colors.yellow,
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
              value: widget.checked,
              onChanged: widget.onTick,
              checkColor: Colors.black,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                widget.toDoText,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    decoration: widget.checked
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ),
            IconButton(onPressed: widget.onDelete, icon: Icon(Icons.cancel))
          ],
        ),
      ),
    );
  }
}
