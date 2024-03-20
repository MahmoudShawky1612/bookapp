import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/Widgets/custom_button.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child:  Row(
        children:[
          CustomButton(
            text: '19.19%',
            textColor: Colors.black,
            backgroungColor: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(16),bottomLeft: Radius.circular(16)),
          ),
          CustomButton(
            text: 'Preview',
            fontSize: 16,
            textColor: Colors.white,
            backgroungColor: Color(0xffEF8262),
            borderRadius: BorderRadius.only(topRight: Radius.circular(16),bottomRight: Radius.circular(16)),
          ),
        ],
      ),
    );
  }
}
