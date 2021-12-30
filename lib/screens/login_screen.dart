import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:shop_app/cache_helper/cache_helper.dart';
import '../cubit/login/login_cubit.dart';
import 'package:shop_app/screens/home_screen.dart';
import 'package:shop_app/screens/register_screen.dart';

import '../components/componint.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
              if(state is LoginSuccessesState){
                  if(state.loginModel.status??true){
                    print(state.loginModel.message);
                    CacheHelper.saveDate(key: 'token', value: state.loginModel.data?.token).then((value){
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                            (route) => false,
                      );                    });
                    // showToast(msg: state.loginModel.message.toString(),state: ToastStates.success,context: context);

                  }else{
                    print(state.loginModel.message);
                    showToast(msg: state.loginModel.message.toString(),state: ToastStates.error,context: context);

                  }
              }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Color(0xffFFFFFF),
            appBar: AppBar(
              backgroundColor: Color(0xffFFFFFF),
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Welcome Back!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Image(
                        image: AssetImage('assets/images/image_login.png'),
                      ),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,

                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter email address';
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.grey,
                          ),
                          hintText: 'E-mail Address',
                          hintStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 3),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        onFieldSubmitted: (value){
                          if (formKey.currentState!.validate()) {
                            LoginCubit.get(context).userLogin(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                        
                        obscureText: LoginCubit.get(context).isPassword,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'password is too short ';
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.grey,
                          ),
                          suffixIcon: IconButton(icon: Icon( LoginCubit.get(context).suffix) ,
                          onPressed: () {
                            LoginCubit.get(context).changePasswordVisibility();
                          },
                         ),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 3),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: ElevatedButton(
                              child: const Text('Login'),
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xff170C51),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  LoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                            ),
                          );
                        },
                        fallback: (context) {
                          return Center(child: CircularProgressIndicator());
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have any account?'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                            },
                            child: Text('register'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
