part of 'login_cubit.dart';

@immutable
abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates{}

class LoginSuccessesState extends LoginStates{
 final LoginModel loginModel;
  LoginSuccessesState(this.loginModel);
}

class LoginErrorState extends LoginStates{
  final String error;
  LoginErrorState(this.error);
}
class ChangePasswordVisibilityState extends LoginStates{

}


