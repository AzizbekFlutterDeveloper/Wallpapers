import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpapers/core/extension/size_extension.dart';
import 'package:wallpapers/core/local_data/local_data.dart';
import 'package:wallpapers/screens/bloc/search_cubit.dart';

class Categories extends StatefulWidget {
 final BuildContext contextt;
 const Categories({Key? key, required this.contextt}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  @override
  void initState() {
    super.initState();
    widget.contextt.read<SearchCubit>().addData(categories[0],0);
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.h * 0.06,
      width: context.w,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: EdgeInsets.only(left: context.w * 0.03),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            child: Container(
              height: context.h * 0.07,
              padding: EdgeInsets.symmetric(horizontal: context.w * 0.04),
              margin: EdgeInsets.symmetric(vertical: context.h * 0.005),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(context.w * 0.07),
                ),
                color: widget.contextt.watch<SearchCubit>().categoriesCount == index? Colors.black : Colors.transparent,
              ),
              child: Center(
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: widget.contextt.watch<SearchCubit>().categoriesCount == index ? Colors.white : Colors.black,
                    fontSize: context.w * 0.07,
                  ),
                ),
              ),
            ),
            onTap: (){
              widget.contextt.read<SearchCubit>().addData(categories[index],index);
            },
          );
        },
      ),
    );
  }
}
