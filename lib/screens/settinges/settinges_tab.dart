import 'package:flutter/material.dart';

import '../login_screen.dart';

class SettingesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: InkWell(
          onTap: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
          },
          child: Text(
            'تسجيل الخروج',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
