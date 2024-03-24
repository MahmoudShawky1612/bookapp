import 'package:flutter/cupertino.dart';
import 'package:flutterprojects/Core/utils/styles/font_styls.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key, required this.errMessage});
  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errMessage,style: Styles.testStyle18,));
  }
}
