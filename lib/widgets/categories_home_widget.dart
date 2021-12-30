import 'package:flutter/material.dart';
import 'package:shop_app/modeles/categories_model.dart';

class CategoriesHomeWidget extends StatelessWidget {
  CategoriesModel? categoriesModel;

  CategoriesHomeWidget(this.categoriesModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Image.network(
                  "${categoriesModel?.data?.data?.elementAt(index).image}",
                  fit: BoxFit.cover,
                  height: 120,
                  width: 120,
                ),
                Container(
                  width: 120,
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(.8)),
                  child: Text(
                    '${categoriesModel?.data?.data?.elementAt(index).name}',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 15,
            );
          },
          itemCount: categoriesModel?.data?.data?.length ?? 0),
    );
  }
}
