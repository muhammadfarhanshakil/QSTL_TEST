import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button(
      {Key? key,
      required this.text,
      required this.press,
      this.bold = false,
      this.isIcon = false,
      required this.color,
      this.icon = const SizedBox(
        height: 0,
        width: 0,
      ),
      this.fontSize = 20,
      this.lessPadding = false})
      : super(key: key);

  final String text;
  final VoidCallback press;
  final Color color;
  final bool isIcon;
  final bool bold;
  final Widget icon;
  final double fontSize;
  final bool lessPadding;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
        padding: lessPadding
            ? const EdgeInsets.symmetric(horizontal: 22.5)
            : const EdgeInsets.symmetric(horizontal: 35),
        child: InkWell(
          onTap: press,
          child: Container(
            height: height / 13,
            width: 700,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(visible: isIcon, child: icon),
                Text(
                  isIcon ? "   $text" : text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: fontSize,
                    letterSpacing: 0.5,
                    color: color == Colors.white
                        ? Colors.black
                        : color == Colors.black54
                            ? Colors.white54
                            : Colors.white,
                    fontWeight: bold ? FontWeight.w800 : FontWeight.normal,
                  ),
                ),
              ],
            )),
          ),
        ));
  }
}
