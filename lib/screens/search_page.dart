import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpapers/screens/bloc/search_cubit.dart';
import 'package:wallpapers/screens/bloc/search_state.dart';
import 'package:wallpapers/service/wallpapers_search_service.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state){
          return _myScaffold(context);
        },
      ),
    );
  }
  Scaffold _myScaffold(BuildContext context) {
    var data = context.watch<SearchCubit>().searchData;
    return Scaffold(
    appBar: AppBar(
      title: TextFormField(
        onChanged: (v){
          WallpapersServiceSearch.getDio(v).then((value){
           context.read<SearchCubit>().addSearch(value);
          });
          
        },
      ),
    ),
    body: ListView.builder(
      itemCount: data == null ? 0 : data['results'].length,
      itemBuilder: (context, index) {
        return Container(
          height: 300,
          color: Colors.amber,
          margin: EdgeInsets.all(30),
          child: CachedNetworkImage(imageUrl: data['results'][index]['urls']['raw'],fit: BoxFit.cover,),
        );
      },
    ),
  );
  }
}