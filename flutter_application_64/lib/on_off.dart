import 'package:flutter/material.dart';

class OnOffWidget extends StatelessWidget {
  final bool isOn;

  OnOffWidget(this.isOn);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.black87, borderRadius: BorderRadius.circular(25)),
      child: Container(
        margin: EdgeInsets.only(
          top: 5,
          bottom: 5,
          left: isOn ? 65 : 0,
          right: isOn ? 0 : 65,
        ),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: isOn ? Colors.green : Colors.grey),
      ),
    );
  }
}
