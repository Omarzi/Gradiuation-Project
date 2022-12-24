import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Function() onPressed;
  final Size size;
  final Color bgColor;
  final String text;
  final Color textColor;
  final double fontSize;
  const DefaultButton({
    Key? key,
    required this.bgColor,
    required this.text,
    required this.textColor,
    required this.fontSize,
    required this.size,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: size,
        shape: const StadiumBorder(),
        backgroundColor: bgColor,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: textColor,
        ),
      ),
    );
  }
}
