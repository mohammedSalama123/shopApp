

import 'package:flutter/material.dart';
import 'package:shop_app/cubit/home/home_cubit.dart';
import 'package:shop_app/modeles/get_favorites_model.dart';

class GridFave extends StatelessWidget {
  GetFavoritesModel? faveModel;
  int index;
  Map<int?,bool?>isFave;
  GridFave({required this.faveModel,required this.index,required this.isFave});
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image.network(
                '${faveModel?.data?.data?.elementAt(index).product?.image}',
                width: double.infinity,
                height: 200,
              ),
              if (faveModel?.data?.data?.elementAt(index).product?.discount != 0)
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
                  '${faveModel?.data?.data?.elementAt(index).product?.name}',
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
                      '${faveModel?.data?.data?.elementAt(index).product?.price?.round()}',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    if (faveModel?.data?.data?.elementAt(index).product?.discount != 0)
                      Text(
                        '${faveModel?.data?.data?.elementAt(index).product?.oldPrice?.round()}',
                        style: const TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                            decorationStyle: TextDecorationStyle.dashed),
                      ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        HomeCubit.get(context).changeFavorites(faveModel?.data?.data?.elementAt(index).product?.id);
                        print(faveModel?.data?.data?.elementAt(index).product?.id);
                      },
                      icon:  CircleAvatar(
                        radius: 15,
                        backgroundColor:isFave[faveModel?.data?.data?.elementAt(index).product?.id]??false?Colors.blue:Colors.grey[300],

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
