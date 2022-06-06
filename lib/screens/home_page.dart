import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpapers/service/wallpapes_service.dart';
import 'package:wallpapers/core/extension/size_extension.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 8, 1, 1),
        leading: IconButton(icon: Icon(Icons.menu,size: context.w *0.07,),onPressed: (){},),
        title: Text(
          "Wallpapers",
          style: TextStyle(
            fontSize: context.w * 0.07,
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search, size: context.w * 0.07,))
        ],
      ),
      body: FutureBuilder(
        future: HttpService.getDio(),
        builder: (context, AsyncSnapshot snap) {
          if (!snap.hasData) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (snap.hasError) {
            return Text("Data Error");
          } else {
            List data = snap.data;
            return Column(
              children: [
                SizedBox(
                  height: context.h * 0.08,
                  width: context.w,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        height: context.h * 0.07,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: context.h * 0.820,
                  width: context.w,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

// return ListView.builder(
            //   itemCount: data.length,
            //   itemBuilder: (context, index) {
            //     return Container(
            //       height: 600,
            //       margin: EdgeInsets.all(30),
            //       width: 200,
            //       color: Colors.amber,
            //       child: CachedNetworkImage(
            //         imageUrl: data[index]['urls']['raw'],
            //         fit: BoxFit.cover,
            //       ),
            //     );
            //   },
            // );