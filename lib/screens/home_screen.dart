
import 'package:flutter/material.dart';
import 'package:shop_app/cache_helper/cache_helper.dart';
import 'package:shop_app/screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),

      ),
      body: TextButton(onPressed: (){
        CacheHelper.removeDate(key: 'token').then((value){
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
                (route) => false,
          );
        });
      }, child: Text('LogOut')),
    );
  }
}
