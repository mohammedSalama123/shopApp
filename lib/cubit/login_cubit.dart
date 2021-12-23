import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/modeles/login_model.dart';
import 'package:shop_app/webservice/end_pointes.dart';
import 'package:shop_app/webservice/webservice.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context)=>BlocProvider.of(context);
 late LoginModel loginModel;
  void  userLogin({required String email,required String password}){
    emit(LoginLoadingState());
    WebService.PostData(url: Login, data: {
      'email':email,
      'password':password,
    }).then((value){
      print(value.data);
      loginModel=LoginModel.fromJson(value.data);
      emit(LoginSuccessesState(loginModel));
    }).catchError((error){
      print(error.toString());
       emit(LoginErrorState(error.toString()));
    });
  }


  IconData suffix=Icons.visibility_outlined;
  bool isPassword=true;

  void changePasswordVisibility(){
    isPassword=!isPassword;
    suffix= isPassword ? Icons.visibility_outlined :Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }


}
