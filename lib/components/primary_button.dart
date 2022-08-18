import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {required this.text,
      this.onPress,
      this.size = const Size(300, 65),
      this.fontSize = 36});
  final String text;
  final onPress;
  final Size size;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF404040),
        textStyle: TextStyle(fontSize: fontSize, fontFamily: 'Jost'),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(18))),
        fixedSize: size,
      ),
    );
  }
}
