import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpapers/screens/bloc/search_cubit.dart';
import 'package:wallpapers/screens/bloc/search_state.dart';
import 'package:wallpapers/core/extension/size_extension.dart';
import 'package:wallpapers/service/wallpapers_search_service.dart';
import 'package:wallpapers/widgets/image_builder.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

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
    var data = context.watch<SearchCubit>().searchData;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          _searchAppBar(context),
          ImageBuilder(data: data,height: 0.89,)
        ],
      ),
    );
  }

  Container _searchAppBar(BuildContext context) {
    return Container(
      height: context.h * 0.11,
      width: context.w,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        color: Colors.black,
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: TextFormField(
          style: TextStyle(
            color: Colors.white,
            fontSize: context.w * 0.06,
          ),
          cursorColor: Colors.white,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Search",
            hintStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          onChanged: (v) {
            WallpapersServiceSearch.getDio(v).then((value) {
              context.read<SearchCubit>().addSearch(value);
            });
          },
        ),
       
      ),
    );
  }
}




