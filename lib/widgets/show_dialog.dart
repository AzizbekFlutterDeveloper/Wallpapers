import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallpapers/core/extension/size_extension.dart';

class AboutShowDialog {
  static aboutShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        content: Container(
          height: context.h * 0.4,
          width: context.w * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(context.w * 0.07)),
            color: Colors.white,
            border: Border.all(color: Colors.black),
          ),
          child: Column(
            children: [
              Container(
                height: context.h * 0.25,
                width: context.w,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(context.w * 0.07)),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/logo.jpg"),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    child: SizedBox(
                      height: context.h * 0.065,
                      width: context.h * 0.065,
                      child: Image.asset("assets/images/instagram.png"),
                    ),
                    onTap: () {
                      _launchURL("https://www.instagram.com/a.karimov_07");
                    },
                  ),
                  InkWell(
                    child: SizedBox(
                      height: context.h * 0.065,
                      width: context.h * 0.065,
                      child: Image.asset("assets/images/telegram.webp"),
                    ),
                    onTap: () {
                      _launchURL("https://t.me/Azizbek0033");
                    },
                  ),
                ],
              ),
              SizedBox(height: context.h * 0.05,),
              Text("Developer: Azizbek Karimov", style: TextStyle(color: Colors.black, fontSize: context.w * 0.04, fontWeight: FontWeight.w600,),)
            ],
          ),
        ),
      ),
    );
  }

  static void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
