import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget icon;
  final Size size;
  final String text;

  CustomOutlineButton({
    this.text,
    this.icon,
    this.size,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: icon ?? Container(),
        label: Text(
          text,
          style: Theme.of(context).textTheme.caption.copyWith(
                fontSize: 18.0,
                fontWeight: FontWeight.w200,
                color: Colors.black,
              ),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 1.5, color: Colors.black),
          backgroundColor: Colors.white,
          onSurface: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
