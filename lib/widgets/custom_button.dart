import 'package:flutter/material.dart';

enum CustomButtonType { elevated, outlined, text, icon }

class CustomButton extends StatelessWidget {
  final CustomButtonType type;
  final String? text;
  final IconData? icon;
  final Color? buttonColor;
  final Color? textColor;
  final double size;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.type,
    this.text,
    this.icon,
    this.buttonColor = Colors.blue,
    this.textColor = Colors.white,
    this.size = 40,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case CustomButtonType.elevated:
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: buttonColor,
            shape: StadiumBorder(),
            minimumSize: Size(size, size),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          ),
          child: buttonChild(),
        );
      case CustomButtonType.outlined:
        return OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: buttonColor!,
              width: 2,
            ),
            shape: StadiumBorder(),
            minimumSize: Size(size, size),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          ),
          child: buttonChild(),
        );
      case CustomButtonType.text:
        return TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            primary: buttonColor,
            shape: StadiumBorder(),
            minimumSize: Size(size, size),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          ),
          child: buttonChild(),
        );
      case CustomButtonType.icon:
        return IconButton(
          onPressed: onPressed,
          padding: EdgeInsets.zero,
          icon: Icon(icon, color: buttonColor),
        );
    }
    return Container();
  }

  Widget buttonChild() {
    if (icon != null) {
      return Padding(
        padding: EdgeInsets.all(size * 0.2),
        child: Icon(icon, color: textColor),
      );
    }
    if (text != null) {
      return Text(
        text!,
        style: TextStyle(
          color: textColor,
          fontSize: size * 0.25,
        ),
      );
    }
    return Container();
  }
}
