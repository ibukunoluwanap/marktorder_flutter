import 'package:flutter/material.dart';
import 'package:marktorder/utils/colors.dart';

class TransparentButton extends StatefulWidget {
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
  final double? width;
  final double? height;
  final TextAlign? textAlign;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final EdgeInsetsGeometry suffixIconPadding;
  final EdgeInsetsGeometry prefixIconPadding;

  const TransparentButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.elevation = 0.0,
    this.padding = const EdgeInsets.all(18.0),
    this.textColor = CustomColor.blue,
    this.bgColor = Colors.transparent,
    this.borderRadius = 0.0,
    this.fontSize = 20.0,
    this.fontWeight = FontWeight.w500,
    this.width,
    this.height,
    this.textAlign,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixIconColor,
    this.prefixIconColor,
    this.suffixIconPadding = const EdgeInsets.all(0.0),
    this.prefixIconPadding = const EdgeInsets.all(0.0),
  }) : super(key: key);

  @override
  _TransparentButtonState createState() => _TransparentButtonState();
}

class _TransparentButtonState extends State<TransparentButton> {
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
        side: const BorderSide(color: Colors.transparent, width: 0.0),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      minWidth: widget.width ?? width,
      height: widget.height,
      child: Row(
        children: [
          Padding(
            padding: widget.prefixIconPadding,
            child: Icon(
              widget.prefixIcon,
              color: widget.prefixIconColor,
            ),
          ),
          Expanded(
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: widget.fontSize,
                fontWeight: widget.fontWeight,
              ),
              textAlign: widget.textAlign,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: widget.suffixIconPadding,
            child: Icon(
              widget.suffixIcon,
              color: widget.prefixIconColor,
            ),
          ),
        ],
      ),
    );
  }
}
