import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/home/home_cubit.dart';

class CategoriesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},

      builder: (context, state) {
        var cubit=HomeCubit.get(context);
        return ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Image.network('${cubit.categoriesModel?.data?.data?.elementAt(index).image}',height: 100,width: 100,fit: BoxFit.cover,),
                  const SizedBox(width: 20,),
                  Text('${cubit.categoriesModel?.data?.data?.elementAt(index).name}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios)
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
              return Divider(

                color: Colors.grey,
              );
          },
          itemCount: cubit.categoriesModel?.data?.data?.length??0,
        );
      },
    );
  }
}
