part of 'home_cubit.dart';

@immutable
abstract class HomeStates {}

class HomeInitial extends HomeStates {}

class ChangeTabeState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {}

class HomeErrorState extends HomeStates {}

class CategoriesSuccessState extends HomeStates {}

class CategoriesErrorState extends HomeStates {}

class ChangeFavoritesState extends HomeStates {}

class ChangeFavoritesSuccessState extends HomeStates {
  final ChangeFavoriteModel? favoriteModel;
  ChangeFavoritesSuccessState(this.favoriteModel);
}

class ChangeFavoritesErrorState extends HomeStates {}

class LoadingGetFavoritesState extends HomeStates {}

class GetFavoritesSuccessState extends HomeStates {}

class GetFavoritesErrorState extends HomeStates {}

