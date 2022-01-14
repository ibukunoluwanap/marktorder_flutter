import 'package:flutter/material.dart';

class SnackBarNotification {
  // text
  final String title;
  final String message;
  final TextAlign textAlign;
  final FontWeight fontWeight;

  // size
  final double titleSize;
  final double textSize;
  final double iconSize;

  // color
  final Color textColor;
  final Color bgColor;
  final Color iconColor;
  final Color dividerColor;

  // time
  final Duration duration;

  // condition
  final bool isFixed;
  final bool isIcon;
  final bool isDivider;
  final bool isClosable;
  final bool isChildLeft;
  final String iconPosition;

  // function
  final VoidCallback? onClick;

  // others :)
  final String type;
  final String mode;
  final String closeIconPosition;
  final Widget? icon;
  final Widget? child;
  final double borderRadius;
  final double mHeight;
  final double margin;

  const SnackBarNotification({
    // text
    this.title = "",
    required this.message,
    this.textAlign = TextAlign.left,
    this.fontWeight = FontWeight.w500,
    // size
    this.titleSize = 18.0,
    this.textSize = 14.0,
    this.iconSize = 24.0,
    // color
    this.textColor = const Color(0xFFffffff),
    this.bgColor = const Color(0xFF323232),
    this.iconColor = const Color(0xFFffffff),
    this.dividerColor = Colors.white70,
    // time
    this.duration = const Duration(seconds: 4),
    // condition
    this.isFixed = true,
    this.isIcon = false,
    this.isDivider = true,
    this.isClosable = true,
    this.isChildLeft = true,
    this.iconPosition = "NORMAL",
    // function
    this.onClick,
    // others :)
    this.type = "SUCCESS",
    this.mode = "BASIC",
    this.closeIconPosition = "NORMAL",
    this.icon,
    this.child,
    this.borderRadius = 10,
    this.mHeight = 40,
    this.margin = 20,
  });

  show(
    BuildContext context,
  ) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            behavior: mode == "BASIC"
                ? (isFixed ? SnackBarBehavior.fixed : SnackBarBehavior.floating)
                : SnackBarBehavior.floating,
            padding: mode != "BASIC" ? const EdgeInsets.all(0) : null,
            margin: mode != "BASIC" ? EdgeInsets.only(bottom: margin) : null,
            duration: duration,
            backgroundColor: mode != "BASIC" ? Colors.transparent : bgColor,
            content: __genrateBar(context),
            elevation: 0,
          ),
        )
        .closed
        .then((value) => ScaffoldMessenger.of(context).clearSnackBars());
  }

  Widget __genrateBar(context) {
    return mode != "BASIC"
        ? Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                  Radius.circular(mode == "ADVANCE" ? borderRadius : 0)),
              child: Container(
                decoration: BoxDecoration(
                  border: mode == "MODERN"
                      ? Border(
                          left: BorderSide(
                            width: 10.0,
                            color:
                                __generateBgColor(), //__getColor("SUCCESS", "dark"),
                          ),
                        )
                      : null,
                  color: mode == "MODERN"
                      ? lighten(__generateBgColor(), .2)
                      : __generateBgColor(),
                ),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(5),
                height: mHeight > 40
                    ? mHeight
                    : title == ""
                        ? 40.0
                        : (titleSize + textSize + 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      textDirection: closeIconPosition == "LEFT"
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      children: [
                        Expanded(
                          child: Row(
                            textDirection: iconPosition == "RIGHT"
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                            mainAxisAlignment: __generatemainAxisAlignment(),
                            children: [
                              isIcon
                                  ? Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: __genrateIcon(),
                                    )
                                  : const SizedBox.shrink(),
                              __genrateText(),
                            ],
                          ),
                        ),
                        (isClosable || child != null)
                            ? Row(
                                textDirection: isChildLeft
                                    ? __generateRtl(true)
                                    : __generateRtl(false),
                                // isChildLeft?__generateRtl(true):,
                                children: [
                                  isClosable
                                      ? GestureDetector(
                                          onTap: () {
                                            onClick == null
                                                ? ScaffoldMessenger.of(context)
                                                    .hideCurrentSnackBar()
                                                : onClick!.call();
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: __closeIcon(),
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                  child != null
                                      ? Container(child: child)
                                      : const SizedBox.shrink(),
                                ],
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        : __genrateText();
  }

  __genrateIcon() {
    var icon = Icons.check_circle;

    if (type == "ERROR") {
      icon = Icons.error;
    } else if (type == "WARNING") {
      icon = Icons.warning_rounded;
    } else if (type == "INFO") {
      icon = Icons.info;
    }
    return Icon(
      icon,
      color: mode == "MODERN"
          ? __generateBgColor()
          : __generateColor(1.0, iconColor),
      size: title == "" ? iconSize : iconSize + 10,
    );
  }

  __closeIcon() {
    return icon ??
        Icon(
          Icons.close_outlined,
          color: __generateColor(1.0, iconColor),
          size: title == "" ? iconSize : iconSize + 5,
        );
  }

  __generateBgColor() {
    String c = const Color(0xFF323232).toString();
    if (bgColor.toString() != c) {
      return bgColor;
    } else if (type == "DARK") {
      c = "161c2d";
    } else if (type == "ERROR") {
      c = 'df4759';
    } else if (type == "WARNING") {
      c = "ffc107";
    } else if (type == "INFO") {
      c = "467fd0";
    } else if (type == "PRIMARY") {
      c = "7c69ef";
    } else if (type == "SECONDARY") {
      c = "d9e2ef";
    } else if (type == "LIGHT") {
      c = "f1f4f8";
    } else if (type == "SUCCESS") {
      c = "42ba96";
    } else {
      c = "ffffff";
    }
    return Color(int.parse("0xff$c"));
  }

  __generateColor(var opacity, var color) {
    if (type == "DARK") {
      return Colors.white.withOpacity(opacity);
    } else if (type == "SECONDARY" ||
        type == "LIGHT" ||
        mode == "MODERN" ||
        type != "DARK") {
      return Colors.black.withOpacity(opacity);
    } else {
      return color.withOpacity(opacity);
    }
  }

  __genrateText() {
    return (mode == "BASIC" || title == "")
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: __getText(message, textSize, FontWeight.normal, 1.0),
          )
        : Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                __getText(title, titleSize, FontWeight.bold, 1.0),
                isDivider
                    ? Divider(
                        color: mode == "MODERN"
                            ? lighten(Color(int.parse("0xff111111")), .1)
                            : dividerColor,
                        height: 2,
                        thickness: 1.5,
                      )
                    : const SizedBox.shrink(),
                __getText(message, textSize, FontWeight.normal, 0.7),
              ],
            ),
          );
  }

  __getText(String text, double size, var fontWeight, var opacity) {
    return SizedBox(
      width: 200.0,
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        style: TextStyle(
          fontSize: size,
          fontWeight: fontWeight,
          color: mode == "MODERN"
              ? __generateColor(opacity, textColor)
              : textColor,
        ),
      ),
    );
  }

  __generatemainAxisAlignment() {
    if (isClosable || iconPosition == "NORMAL") {
      return MainAxisAlignment.start;
    } else if (iconPosition == "LEFT" || iconPosition == "RIGHT") {
      return MainAxisAlignment.spaceBetween;
    } else if (iconPosition == "CENTER") {
      return MainAxisAlignment.center;
    }
  }

  __generateRtl(var type) {
    return type ? TextDirection.rtl : TextDirection.ltr;
  }

  Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }
}
