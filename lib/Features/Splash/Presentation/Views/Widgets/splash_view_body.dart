
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterprojects/Core/utils/app_router.dart';
import 'package:flutterprojects/Core/utils/assets.dart';
import 'package:flutterprojects/Features/Splash/Presentation/Views/Widgets/text_sliding.dart';
import 'package:go_router/go_router.dart';



class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override

  void initState() {
    super.initState();
    initSlideAnimation();
    navigateToHome();
  }

  @override
  void dispose(){
    animationController.dispose();
  }
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(AssetsData.logo),),
          SizedBox(height: 10,),
          TextSliding(slidingAnimation: slidingAnimation),
        ],
      ),
    );
  }
  void navigateToHome() {
     Future.delayed(Duration(seconds: 4),//how long it takes to start the animation
            () {
      // Get.to(()=>HomeView(),
      //   transition: Transition.fade,duration: transitionDuration,//how long the animation takes
              GoRouter.of(context).push(AppRouter.kHomeView);

       });
  }

  void initSlideAnimation() {
    animationController=AnimationController(vsync: this,
        duration: const Duration(seconds: 3));

    slidingAnimation=Tween<Offset>(begin:const Offset(0,7) ,end:const Offset(0,0) ).animate(animationController);

    animationController.forward();
  }
}













