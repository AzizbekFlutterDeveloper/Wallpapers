import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpapers/core/extension/size_extension.dart';
import 'package:wallpapers/model/wallpaper_model.dart';

class ImageBuilder extends StatelessWidget {
  List<Post> data;
  var height;
  ImageBuilder({Key? key, required this.data, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.h * height,
      width: context.w,
      child: MasonryGridView.count(
        crossAxisCount: 2,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
            horizontal: context.w * 0.05,
            vertical: height != null ? context.h * 0.02 : 0),
        mainAxisSpacing: context.h * 0.02,
        crossAxisSpacing: context.w * 0.05,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: Hero(
              tag: "$index",
              child: Container(
                height: context.h * 0.275,
                margin: index == 1
                    ? EdgeInsets.only(top: context.h * 0.05)
                    : EdgeInsets.all(0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(context.w * 0.07)),
                  color: Colors.grey,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(context.w * 0.07)),
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    placeholder: 'assets/images/loading2.gif',
                    image: data[index].urls!.small!,
                  ),
                ),
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, '/image',arguments: [data[index],index]);
            },
          );
        },
      ),
    );
  }
}
