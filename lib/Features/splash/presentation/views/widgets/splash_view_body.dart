import 'package:bloc_mvvm_pattern/Features/home/presentation/views/widgets/home_view.dart';
import 'package:bloc_mvvm_pattern/Features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:bloc_mvvm_pattern/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

import '../../../../../constants.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState(){
    initSlidingAnimation();
    navigateToHome();
    super.initState();
  }


  @override
 void dispose(){
    super.dispose();
    animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //stretch : تقدر تاخده width اكبر  children كده انا بقوله عاوز ال
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo,),
        const SizedBox(height: 4,),
        AnimatedBuilder(
          animation: slidingAnimation,
          builder: (context,_){
            return SlidingText(slidingAnimation: slidingAnimation);
          }
        ),

      ],
    );
  }
  void initSlidingAnimation(){
    animationController=AnimationController(vsync: this,duration: const Duration(seconds: 3) );
    slidingAnimation=Tween<Offset>(begin: const Offset(0,3) ,end:Offset.zero).animate(animationController);
    animationController.forward();
    slidingAnimation.addListener(() {setState((){}); });

  }
  void navigateToHome() {
    Future.delayed(const Duration(seconds: 4),
            () {
          Get.to(() => const HomeView(),transition: Transition.fade,duration: kTranstionDuration);
        });
  }
}

