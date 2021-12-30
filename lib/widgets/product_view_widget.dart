
import 'package:flutter/material.dart';
import 'package:shop_app/modeles/home_model.dart';
import 'package:shop_app/widgets/build_grid_product_widget.dart';

class ProductView extends StatelessWidget {
  HomeModel? homeModel;
  ProductView(this.homeModel);
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.grey[300],
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 2 / 3.2,
        children: List.generate(
          homeModel?.data?.products?.length ?? 0,
              (index) => GridProduct(homeModel,index),
        ),
      ),
    );
  }
}
