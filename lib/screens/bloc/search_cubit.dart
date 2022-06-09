import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpapers/model/wallpaper_model.dart';
import 'package:wallpapers/screens/bloc/search_state.dart';
import 'package:wallpapers/service/wallpapers_search_service.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());


  List<Post> searchData = [];
  TextEditingController controller = TextEditingController();

  void addSearch(var v)async{
    searchData = v;
    emit(TextState());
  }

  List<Post> homeData = [];
  int categoriesCount = 0;

  void addData(data, int count)async{
    categoriesCount = count;
    await WallpapersServiceSearch.getDio(data,10).then((value) {
      homeData = value;
    });
    emit(CategoriesState());
  }

  bool likesBool = false;
  int likesCount = 0;

  void addLike(){
    likesBool = !likesBool;
    if(likesBool){
      likesCount = 1;
    }else{
      likesCount = 0;
    }
    emit(LikesState());
  }

  bool isLoading = false;

  void addLoading(){
    isLoading = !isLoading;
    print(isLoading);
    emit(LoadingState());
  }
}