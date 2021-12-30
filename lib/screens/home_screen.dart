import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cache_helper/cache_helper.dart';
import 'package:shop_app/cubit/home/home_cubit.dart';
import 'package:shop_app/screens/carts/carts_screen.dart';
import 'package:shop_app/screens/login_screen.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:shop_app/screens/serch/serch_screen.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var cubit=HomeCubit.get(context);
        return Scaffold(
          backgroundColor: Color(0xffFFFFFF),

          appBar: AppBar(
            leading: Icon(
              Icons.add_shopping_cart,color: Colors.blue,
            ),
            title: Text('Salama Shop',style: TextStyle(color: Colors.blue),),
            actions: [
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
              }, icon: Icon(Icons.search,color: Colors.blue,))
            ],
            backgroundColor: Color(0xffFFFFFF),
            elevation: 0,
          ),
          body: cubit.tabs[cubit.currentIndex],
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CartsScreen()));
            },
            child: const Icon(Icons.shopping_cart,),backgroundColor: Colors.blue,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar(
            icons: const [
              Icons.home,
              Icons.waves,
              Icons.favorite,
              Icons.settings,
            ],
            activeIndex: cubit.currentIndex,
            activeColor: Colors.white,
            gapLocation: GapLocation.center,
            backgroundColor: Colors.blue,
            notchSmoothness: NotchSmoothness.smoothEdge,
            leftCornerRadius: 64,
            rightCornerRadius: 64,
            onTap:(index){
              cubit.changeTabe(index);
            },
            //other params
          ),
        );
      },
    );
  }
}
