import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/cache_helper/cache_helper.dart';
import 'package:shop_app/cubit/home/home_cubit.dart';
import 'package:shop_app/cubit/observer.dart';
import 'package:shop_app/screens/home_screen.dart';
import 'package:shop_app/screens/login_screen.dart';
import 'package:shop_app/screens/onbording_screen.dart';
import 'package:shop_app/webservice/webservice.dart';

import 'components/constance.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WebService.init();

  await CacheHelper.init();
  Widget widget;
  bool? onBording = CacheHelper.getDate(key: 'onBording');
   token = CacheHelper.getDate(key: 'token');
  if (onBording != null) {
    if (token != null) {
      widget = HomeScreen();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = OnBordingScreen();
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
  const MyApp({this.startWidget, Key? key}) : super(key: key);
  final Widget? startWidget;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeDate()..getCategoriesData()..getFavorites(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: startWidget,
      ),
    );
  }
}
