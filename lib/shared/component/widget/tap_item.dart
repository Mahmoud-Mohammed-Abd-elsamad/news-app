import 'package:flutter/material.dart';

import '../const.dart';

class TapItem extends StatefulWidget {
  const TapItem({Key? key, required this.text, required this.isSelected}) : super(key: key);

  final String text;
  final bool isSelected;

  @override
  State<TapItem> createState() => _TapItemState();
}

class _TapItemState extends State<TapItem> {
  @override
  Widget build(BuildContext context) {
    return Container
      (
      height: 30,
      decoration: BoxDecoration(
        color: widget.isSelected ? Const.PRIMARY_COLOR : Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: Border.all(color: Const.PRIMARY_COLOR)
      ),
      child: Center(child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(widget.text,style: TextStyle(color: widget.isSelected ?Colors.white : Const.PRIMARY_COLOR  ),),
      )),
    );
  }
}
