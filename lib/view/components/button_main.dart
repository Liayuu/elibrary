import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonMain extends StatelessWidget {
  Function onTap;
  String label;
  IconData? icon;
  TextStyle? style;
  Color? background, color, iconColor;
  double? width, height;

  ButtonMain(
      {Key? key,
      required this.onTap,
      this.label = "",
      this.background,
      this.color ,
      this.iconColor,
      this.width = 140,
      this.height = 40,
      this.icon,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: color??Colors.black, width: 2),
        borderRadius: BorderRadius.circular(12),
        color: background,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          splashColor: Colors.white,
          onTap: onTap as void Function()?,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null
                  ? Icon(
                      icon,
                      color: iconColor,
                    )
                  : SizedBox(),
              icon != null ? SizedBox(width: 8) : SizedBox(),
              Text(
                label,
                style: style,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
