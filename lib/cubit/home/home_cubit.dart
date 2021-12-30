import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/components/constance.dart';
import 'package:shop_app/modeles/categories_model.dart';
import 'package:shop_app/modeles/change_favorite_model.dart';
import 'package:shop_app/modeles/get_favorites_model.dart';
import 'package:shop_app/modeles/home_model.dart';
import 'package:shop_app/screens/categories_tab/categories_tab.dart';
import 'package:shop_app/screens/favourites/favourites_tab.dart';
import 'package:shop_app/screens/home_tab/home_tab.dart';
import 'package:shop_app/screens/settinges/settinges_tab.dart';
import 'package:shop_app/webservice/end_pointes.dart';
import 'package:shop_app/webservice/webservice.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> tabs = [
    HomeTab(),
    CategoriesTab(),
    FavoratiesTab(),
    SettingesTab(),
  ];

  void changeTabe(int index) {
    currentIndex = index;
    emit(ChangeTabeState());
  }

  HomeModel? homeModel;
  Map<int?, bool?> favorite = {};

  void getHomeDate() {
    emit(HomeLoadingState());
    WebService.getData(url: home, token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel?.data?.products![0].name.toString());
      homeModel?.data?.products?.forEach((element) {
        favorite.addAll({
          element.id: element.inFavorites,
        });
      });
      emit(HomeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeErrorState());
    });
  }

  CategoriesModel? categoriesModel;

  void getCategoriesData() {
    WebService.getData(url: categories).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      print(
          'categories is a ${categoriesModel?.data?.data?.elementAt(0).name}');
      emit(CategoriesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CategoriesErrorState());
    });
  }

  ChangeFavoriteModel? changeFavoriteModel;

  void changeFavorites(int? productId) {

    favorite[productId] = ! (favorite[productId]??false);
    emit(ChangeFavoritesState());
    WebService.PostData(
      url: favorites,
      data: {
        'product_id': productId,
      },
      token: token,
    ).then((value) {
      changeFavoriteModel=ChangeFavoriteModel.fromJson(value.data);
      print(value.data);
      if(!(changeFavoriteModel?.status??false)){
            favorite[productId]=!(favorite[productId]??false);
      }else{
        getFavorites();
      }
      emit(ChangeFavoritesSuccessState(changeFavoriteModel));
    }).catchError((error) {
      favorite[productId]=!(favorite[productId]??false);

      emit(ChangeFavoritesErrorState());
    });
  }

  GetFavoritesModel? favoritesModel;
  void getFavorites() {
    emit(LoadingGetFavoritesState());
    WebService.getData(url: favorites,token: token).then((value) {
      favoritesModel = GetFavoritesModel.fromJson(value.data);
      print(
          'Favorites is a ${favoritesModel?.data?.data?.elementAt(0).product?.name}');
      emit(GetFavoritesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetFavoritesErrorState());
    });
  }
}
