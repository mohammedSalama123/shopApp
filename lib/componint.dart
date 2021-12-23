
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

void showToast({required String msg,required ToastStates state,context}){
  MotionToast(
    primaryColor: choseToastColor(state),
    backgroundType:  BACKGROUND_TYPE.transparent,
    secondaryColor:  Colors.transparent,

    descriptionStyle: TextStyle(color: Colors.black,),
    description: msg,
    animationType: ANIMATION.fromBottom,
    dismissable: true,
    animationCurve: Curves.elasticInOut,
    toastDuration: Duration(milliseconds: 3000),
    icon: Icons.message,
    iconSize: 20,

  ).show(context);
}
enum ToastStates{
  success,error,waring,
}
Color choseToastColor(ToastStates state){
  Color color;
        switch(state)
        {
          case ToastStates.success:
            color=Colors.green;
            break;
          case ToastStates.error:
            color=Colors.red;
            break;
          case ToastStates.waring:
            color=Colors.yellow;
            break;
        }
     return color;
}