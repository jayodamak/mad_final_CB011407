import 'package:flutter/material.dart';

class EditItem extends StatefulWidget {
  final Widget widget;
  final String title;

  const EditItem({
    Key? key,
    required this.widget,
    required this.title,
  }) : super(key: key);

  @override
  State<EditItem> createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(

          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ),
        SizedBox(width: 40,),
        Expanded(
          flex: 4,
          child: widget.widget,
        ),
      ],
    );
  }
}
