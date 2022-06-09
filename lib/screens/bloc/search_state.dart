abstract class SearchState{}

class SearchInitial extends SearchState{
  SearchInitial();
}

class TextState extends SearchState{
  TextState();
}

class CategoriesState extends SearchState{
  CategoriesState();
}

class LikesState extends SearchState{
  LikesState();
}

class LoadingState extends SearchState{
  LoadingState();
}