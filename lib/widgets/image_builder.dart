import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpapers/core/extension/size_extension.dart';
import 'package:wallpapers/model/wallpaper_model.dart';

class ImageBuilder extends StatefulWidget {
  List<Post> data;
  double? height;
  ImageBuilder({Key? key, required this.data, this.height}) : super(key: key);

  @override
  State<ImageBuilder> createState() => _ImageBuilderState();
}

class _ImageBuilderState extends State<ImageBuilder> {
  
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollStatus) {
        final metrics = scrollStatus.metrics;
        if(metrics.atEdge){
          bool isTop = metrics.pixels == 0;
          if(isTop){
            print("toppppppppppp");
          }else{
            print('botttommmmmm');
            
          }
        }
        return true;
      },
      child: SizedBox(
        height: context.h * widget.height!,
        width: context.w,
        child: MasonryGridView.count(
          crossAxisCount: 2,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
              horizontal: context.w * 0.05,
              vertical: widget.height != null ? context.h * 0.02 : 0),
          mainAxisSpacing: context.h * 0.02,
          crossAxisSpacing: context.w * 0.05,
          itemCount: widget.data.length,
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
                      image: widget.data[index].urls!.regular!,
                    ),
                  ),
                ),
              ),
              onTap: (){
                Navigator.pushNamed(context, '/image',arguments: [widget.data[index],index]);
              },
            );
          },
        ),
      ),
    );
  }
}
