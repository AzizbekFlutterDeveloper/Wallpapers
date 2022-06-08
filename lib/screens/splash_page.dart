import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:wallpapers/screens/home_page.dart';
import 'package:wallpapers/core/extension/size_extension.dart';



class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SplashScreenView(
          navigateRoute: const HomePage(),
          duration: 6000,
          imageSize: 250,
          imageSrc: "assets/images/bg_no (5).png",
          text: "Wallpaper",
          textType: TextType.ColorizeAnimationText,
          textStyle: TextStyle(
            fontSize: context.h * 0.05,
          ),
          colors: const [
            Colors.white,
            Colors.grey,
            Colors.black,
          ],
          backgroundColor: Colors.black,
        ),
        Positioned(
          child: SizedBox(
            height: context.h * 0.2,
            child: Image.asset("assets/images/logo_withe.png"),
          ),
        ),
      ],
    );
  }
}
