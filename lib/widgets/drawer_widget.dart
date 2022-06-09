import 'package:flutter/material.dart';
import 'package:wallpapers/core/extension/size_extension.dart';
import 'package:wallpapers/core/local_data/local_data.dart';
import 'package:wallpapers/service/share_service.dart';
import 'package:wallpapers/widgets/show_dialog.dart';

drawer(BuildContext context) {
  return Drawer(
    backgroundColor: Colors.black.withOpacity(0.4),
    child: Column(
      children: [
        Container(
          height: context.h * 0.2,
          decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/images/fonyer.jpg")),
          ),
        ),
        for (var i = 0; i < 3; i++)
          ListTile(
            leading: Icon(drawers[i]['icon'],
                size: context.w * 0.06, color: Colors.white),
            title: Text(
              drawers[i]['name'],
              style: TextStyle(color: Colors.white, fontSize: context.w * 0.06),
            ),
            onTap: () {
              if (i == 0) {
                Navigator.pop(context);
              } else if (i == 1) {
                Serviceshare.share();
              } else {
                Navigator.pop(context);
                AboutShowDialog.aboutShowDialog(context);
              }
            },
          ),
        const Spacer(),
        ListTile(
          leading: Icon(Icons.help_outline,
              size: context.w * 0.06, color: Colors.white),
          title: Text("help",
              style:
                  TextStyle(color: Colors.white, fontSize: context.w * 0.06)),
          onTap: () {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.transparent,
                content: Container(
                  height: context.h * 0.2,
                  width: context.w * 0.9,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(context.w * 0.07)),
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                  padding: EdgeInsets.all(context.w * 0.02),
                  child: Center(
                    child: Text(
                      "This can consume a lot of traffic due to the high image quality in our program !",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: context.w * 0.07),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        SizedBox(
          height: context.h * 0.025,
        )
      ],
    ),
  );
}
