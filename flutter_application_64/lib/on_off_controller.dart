import 'package:flutter/material.dart';

class OnOffWidget2 extends StatefulWidget {
  final OnOffController controller;
  final Function()? onStateChange;

  OnOffWidget2(this.controller, {this.onStateChange});

  @override
  _OnOffWidget2State createState() => _OnOffWidget2State();
}

class _OnOffWidget2State extends State<OnOffWidget2> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.controller.isOn = !widget.controller.isOn;
        });
        if (widget.onStateChange != null) {
          widget.onStateChange!();
        }
      },
      child: Container(
        width: 120,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.black87, borderRadius: BorderRadius.circular(25)),
        child: AnimatedContainer(
          curve: Curves.linear,
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.only(
            top: 5,
            bottom: 5,
            left: widget.controller.isOn ? 70 : 0,
            right: widget.controller.isOn ? 0 : 70,
          ),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.controller.isOn ? Colors.green : Colors.grey),
        ),
      ),
    );
  }
}

class OnOffController {
  bool isOn;

  OnOffController(this.isOn);
}
