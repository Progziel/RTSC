import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  const CustomTextWidget({Key? key,required this.text,this.fontWeight,this.textColor,this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: fontSize ?? 12.0,
        fontFamily: 'Nunito',
       // overflow: TextOverflow.ellipsis,
      ),
      softWrap: true,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      //textWidthBasis: TextWidthBasis.parent,
    );
  }
}
