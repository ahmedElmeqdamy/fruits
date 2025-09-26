import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {

@override
  void initState() {
    excuteNavigation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/images/plant.svg'),
          ],
        ),
        Image.asset('assets/images/fruits_logo.png'),
        SvgPicture.asset('assets/images/bottom_splash.svg', fit: BoxFit.fill,),
      ],
    );
  }

  void excuteNavigation() {

  Future.delayed( Duration(seconds: 2),(){
    Navigator.pushReplacementNamed(context, 'onBoardingView');
  });

  }
}
