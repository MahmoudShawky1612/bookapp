import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterprojects/Core/utils/app_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40,top: 50,),
      child: Row(
        children: [
         const Image(image: AssetImage(AssetsData.logo,),height: 30,),
          const Spacer(),

          IconButton(onPressed: (){
            GoRouter.of(context).push(AppRouter.kSearchView);
          },
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 17,
              ))

        ],
      ),
    );
  }
}