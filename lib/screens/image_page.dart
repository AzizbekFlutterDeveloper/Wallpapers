import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  final int index;
  final String image;
  const ImagePage({Key? key, required this.image, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: "$index",
        child: Container(
          decoration:BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(image),
            ),
          ),
        ),
      ),
    );
  }
}