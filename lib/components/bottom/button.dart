import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marktorder/utils/color_constants.dart';

class Button extends StatefulWidget {
  // no docs :) just random
  final String text;
  final double elevation;
  final EdgeInsetsGeometry padding;
  final Function()? onPressed;
  final Color textColor;
  final Color bgColor;
  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;
  final double letterSpacing;

  const Button({
    Key? key,
    required this.text,
    required this.onPressed,
    this.elevation = 0.0,
    this.padding = const EdgeInsets.all(18.0),
    this.textColor = CustomColor.blue,
    this.bgColor = CustomColor.green,
    this.borderRadius = 10.0,
    this.fontSize = 20.0,
    this.fontWeight = FontWeight.w500,
    this.letterSpacing = 0.15,
  }) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return MaterialButton(
      padding: widget.padding,
      onPressed: widget.onPressed,
      elevation: widget.elevation,
      textColor: widget.textColor,
      color: widget.bgColor,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: CustomColor.gray, width: 0.0),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      minWidth: width,
      child: Text(
        widget.text,
        style: GoogleFonts.poppins(
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            letterSpacing: widget.letterSpacing),
      ),
    );
  }
}
