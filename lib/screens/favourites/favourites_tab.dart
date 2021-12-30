
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/home/home_cubit.dart';
import 'package:shop_app/widgets/build_grid_fave_widget.dart';

class FavoratiesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
        builder: (context,state)=>


          HomeCubit.get(context).favoritesModel == null
              ?
          Center(child: CircularProgressIndicator(color: Colors.blue,),)
              :
    HomeCubit.get(context).favoritesModel!.data!.data!.isEmpty?
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "There is no product in your favourite try add some",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 25),
              ),
            ],
          ):
            Container(
            color: Colors.grey[300],
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 1,

              children: List.generate(
                HomeCubit.get(context).favoritesModel?.data?.data?.length ?? 0,
                    (index) => GridFave(faveModel:  HomeCubit.get(context).favoritesModel, index: index, isFave: HomeCubit.get(context).favorite)
              ),
            ),
          ),

        );
  }
}
