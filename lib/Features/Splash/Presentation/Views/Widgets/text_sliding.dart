import 'package:flutter/cupertino.dart';

class TextSliding extends StatelessWidget {
  const TextSliding({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context,_) {
          return SlideTransition(
            position:slidingAnimation ,
            child:const Text("Discover a new life in each Book....",
              style: TextStyle(
                fontSize: 10,
              ),),
          );
        }
    );
  }
}
