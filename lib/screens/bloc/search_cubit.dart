import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpapers/screens/bloc/search_state.dart';
import 'package:wallpapers/service/wallpapers_search_service.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());


  var searchData;
  TextEditingController controller = TextEditingController();

  void addSearch(var v)async{
    searchData = v;
    emit(TextState());
  }
}