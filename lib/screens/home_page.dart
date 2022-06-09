import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpapers/core/base/base_view.dart';
import 'package:wallpapers/model/wallpaper_model.dart';
import 'package:wallpapers/screens/bloc/search_cubit.dart';
import 'package:wallpapers/screens/bloc/search_state.dart';
import 'package:wallpapers/core/extension/size_extension.dart';
import 'package:wallpapers/widgets/categories_widget.dart';
import 'package:wallpapers/widgets/drawer_widget.dart';
import 'package:wallpapers/widgets/image_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModal: const HomePage(),
      onPageBuilder: (context, widget){
        return BlocProvider(
        create: (context) => SearchCubit(),
        child: BlocConsumer<SearchCubit, SearchState>(
          listener: (context, state) {},
          builder: (context, state) {
            return _homeScaffold(context);
          },
        ),
      );
      },
    );
  }

  Scaffold _homeScaffold(BuildContext context) {
    List<Post> data = context.watch<SearchCubit>().homeData;
    return Scaffold(
      drawer: drawer(context),
      body: Column(
        children: [
          _homeAppBar(context),
          Categories(contextt: context),
          ImageBuilder(data: data,height: 0.822,),
          
        ],
      ),
    );
  }

  Container _homeAppBar(BuildContext context) {
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
        title: Text(
          "Wallpapers",
          style: TextStyle(
            fontSize: context.w * 0.08,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
            icon: Icon(
              Icons.search,
              size: context.w * 0.07,
            ),
          )
        ],
      ),
    );
  }
}
