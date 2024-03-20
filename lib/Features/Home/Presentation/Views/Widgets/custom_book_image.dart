import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/utils/assets.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio:1.2/1.9,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: Colors.red,
          image:const DecorationImage(
            image: AssetImage(AssetsData.test),
            fit: BoxFit.fill,

          ),
        ),
      ),
    );
  }
}



