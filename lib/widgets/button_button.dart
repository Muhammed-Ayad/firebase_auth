import 'package:flutter/material.dart';

class ButtonButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color textColor;
  final Color bgColor;
  ButtonButton({
    required this.onPressed,
    required this.title,
    required this.textColor,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: bgColor,
        child: Text(
          title,
          style: TextStyle(
            color:textColor,
            fontSize: 20,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
