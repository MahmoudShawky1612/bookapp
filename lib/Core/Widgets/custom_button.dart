import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterprojects/Core/utils/styles/font_styls.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.textColor, required this.backgroungColor, this.borderRadius, this.fontSize,required this.text, this.onPressed});
  final Color textColor;
  final Color backgroungColor;
  final BorderRadius? borderRadius;
  final double? fontSize;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: backgroungColor,
            shape: RoundedRectangleBorder(
              borderRadius:borderRadius ?? BorderRadius.circular(12),
            ),
          ),
          child:
          Text(
              text,
             style: Styles.testStyle18.copyWith(
              color: textColor,
              fontWeight: FontWeight.w900,
               fontSize:fontSize,

             ),


          )),
    );
  }
}


 
















