import 'dart:typed_data';

import 'package:badges/badges.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:lottie/lottie.dart';
import 'package:wallpapers/model/wallpaper_model.dart';
import 'package:wallpapers/core/extension/size_extension.dart';
import 'package:wallpapers/screens/bloc/search_cubit.dart';
import 'package:wallpapers/screens/bloc/search_state.dart';

class ImagePage extends StatelessWidget {
  final int index;
  final Post image;
  const ImagePage({Key? key, required this.image, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          return _myScaffold(context);
        },
      ),
    );
  }

  Scaffold _myScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
            height: context.h,
            width: context.w,
            child: FadeInImage.assetNetwork(
              fit: BoxFit.cover,
              placeholderFit: BoxFit.none,
              placeholder: 'assets/images/loadingText.gif.crdownload',
              image: image.urls!.regular!,
              height: 25,
            ),
          ),
          SizedBox(
            height: context.h,
            width: context.w,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: context.h * 0.05,
                horizontal: context.w * 0.05,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    child: Chip(
                        label: Icon(
                      Icons.arrow_back,
                      size: context.w * 0.06,
                    )),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Badge(
                        padding: EdgeInsets.all(context.w * 0.02),
                        badgeColor: Colors.white,
                        badgeContent: Text(
                            "${image.likes! + context.watch<SearchCubit>().likesCount}"),
                        child: GestureDetector(
                          child: CircleAvatar(
                            radius: context.w * 0.08,
                            backgroundColor: Colors.white,
                            child: context.watch<SearchCubit>().likesBool
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: context.w * 0.08,
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                    color: Colors.black,
                                    size: context.w * 0.08,
                                  ),
                          ),
                          onTap: () {
                            context.read<SearchCubit>().addLike();
                          },
                        ),
                      ),
                      GestureDetector(
                        child: CircleAvatar(
                          radius: context.w * 0.08,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.save_alt,
                            color: Colors.black,
                            size: context.w * 0.08,
                          ),
                        ),
                        onTap: () async {
                          context.read<SearchCubit>().addLoading();
                          var response = await Dio().get(
                              image.urls!.raw!,
                              options:
                                  Options(responseType: ResponseType.bytes));
                          final result = await ImageGallerySaver.saveImage(
                              Uint8List.fromList(response.data),
                              quality: 60,
                              name: "hello");
                        context.read<SearchCubit>().addLoading();
                        showDialog(context: context, builder:(context)=> AlertDialog(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          content: Lottie.asset("assets/animation/78630-personal-check.json"),
                        ));
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.h * 0.05,
                  )
                ],
              ),
            ),
          ),
          Visibility(
            visible: context.watch<SearchCubit>().isLoading,
            child: Container(
              height: context.h,
              width: context.w,
              color: Colors.white.withOpacity(0.6),
              child: Center(
                child: SizedBox(height:context.h * 0.1,child: Lottie.asset("assets/animation/52635-loading.json")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
