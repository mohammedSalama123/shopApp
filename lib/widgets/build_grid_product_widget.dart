import 'package:flutter/material.dart';
import 'package:shop_app/cubit/home/home_cubit.dart';
import 'package:shop_app/modeles/home_model.dart';

class GridProduct extends StatelessWidget {
  HomeModel? model;
  int index;

  GridProduct(this.model,this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image.network(
                '${model?.data?.products?.elementAt(index)?.image}',
                width: double.infinity,
                height: 200,
              ),
              if (model?.data?.products?.elementAt(index)?.discount != 0)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12)),
                  child: const Text(
                    'discount',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model?.data?.products?.elementAt(index)?.name}',
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${model?.data?.products?.elementAt(index)?.price.round()}',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    if (model?.data?.products?.elementAt(index)?.discount != 0)
                      Text(
                        '${model?.data?.products?.elementAt(index)?.oldPrice.round()}',
                        style: const TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                            decorationStyle: TextDecorationStyle.dashed),
                      ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        HomeCubit.get(context).changeFavorites(model?.data?.products?.elementAt(index)?.id);
                        print(model?.data?.products?.elementAt(index)?.id);
                      },
                      icon:  CircleAvatar(
                        radius: 15,
                        backgroundColor:HomeCubit.get(context).favorite[model?.data?.products?.elementAt(index)?.id]??false? Colors.blue:Colors.grey,
                        child: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
