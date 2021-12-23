import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/cache_helper/cache_helper.dart';
import 'package:shop_app/cubit/observer.dart';
import 'package:shop_app/screens/home_screen.dart';
import 'package:shop_app/screens/login_screen.dart';
import 'package:shop_app/screens/onbording_screen.dart';
import 'package:shop_app/webservice/webservice.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WebService.init();

  await CacheHelper.init();
  Widget widget;
  bool? onBording = CacheHelper.getDate(key: 'onBording');
  String? token = CacheHelper.getDate(key: 'token');
  if(onBording!=null ){
    if(token!=null){
      widget=HomeScreen();
    }else{
      widget =LoginScreen();
    }
  }else{
    widget= OnBordingScreen();
  }
//   print(onBording);

  BlocOverrides.runZoned(
    () {
      runApp(MyApp(
        startWidget: widget,
      ));
    },
    blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({this.startWidget , Key? key}) : super(key: key);
   final Widget? startWidget;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: startWidget,
    );
  }
}
