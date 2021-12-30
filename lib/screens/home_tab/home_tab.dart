import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/components/componint.dart';
import 'package:shop_app/cubit/home/home_cubit.dart';
import 'package:shop_app/modeles/categories_model.dart';
import 'package:shop_app/modeles/home_model.dart';
import 'package:shop_app/widgets/banner_view_widget.dart';
import 'package:shop_app/widgets/categories_home_widget.dart';
import 'package:shop_app/widgets/product_view_widget.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if(state is ChangeFavoritesSuccessState){
            if(!(state.favoriteModel?.status??false)){
              showToast(msg: '${state.favoriteModel?.message}', state: ToastStates.error,context: context);
            }
            else{
              showToast(msg: '${state.favoriteModel?.message}', state: ToastStates.success,context: context);
            }
        }
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.homeModel != null && cubit.categoriesModel != null,
          builder: (context) => HomeView(cubit.homeModel,cubit.categoriesModel,),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget HomeView(HomeModel? prodictmodel,CategoriesModel? categoriesModel ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          BannerView(prodictmodel),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Categories",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CategoriesHomeWidget(categoriesModel),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Products",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          ProductView(prodictmodel),
        ],
      ),
    );
  }




  // Widget bannersView(HomeModel? model) {
  //   List<Widget> bannerList = [];
  //   model?.data?.banners?.forEach((element) {
  //     bannerList.add(
  //       ClipRRect(
  //         borderRadius: BorderRadius.circular(30),
  //         child: Image.network(
  //           '${element.image}',
  //           width: double.infinity,
  //           fit: BoxFit.cover,
  //         ),
  //       ),
  //     );
  //   });
  //
  //   return CarouselSlider(
  //     items: bannerList,
  //     options: CarouselOptions(
  //       height: 250,
  //       initialPage: 0,
  //       autoPlay: true,
  //       autoPlayAnimationDuration: Duration(seconds: 1),
  //       scrollDirection: Axis.horizontal,
  //       enableInfiniteScroll: true,
  //       reverse: true,
  //       autoPlayInterval: Duration(seconds: 3),
  //       autoPlayCurve: Curves.bounceOut,
  //       viewportFraction: 1,
  //     ),
  //   );
  // }

  //
  // Widget productsView(HomeModel? model) {
  //   return Container(
  //     color: Colors.grey[300],
  //     child: GridView.count(
  //       shrinkWrap: true,
  //       physics: const NeverScrollableScrollPhysics(),
  //       crossAxisCount: 2,
  //       mainAxisSpacing: 2,
  //       crossAxisSpacing: 2,
  //       childAspectRatio: 2 / 3.2,
  //       children: List.generate(
  //         model?.data?.products?.length ?? 0,
  //         (index) => buildGridProdact(model?.data?.products![index]),
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget buildGridProdact(Products? products) {
  //   return Container(
  //     color: Colors.white,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Stack(
  //           alignment: AlignmentDirectional.bottomStart,
  //           children: [
  //             Image.network(
  //               '${products?.image}',
  //               width: double.infinity,
  //               height: 200,
  //             ),
  //             if (products?.discount != 0)
  //               Container(
  //                 padding: EdgeInsets.symmetric(horizontal: 10),
  //                 decoration: BoxDecoration(
  //                     color: Colors.red,
  //                     borderRadius: BorderRadius.circular(12)),
  //                 child: const Text(
  //                   'discount',
  //                   style: TextStyle(fontSize: 16),
  //                 ),
  //               ),
  //           ],
  //         ),
  //         Padding(
  //           padding: EdgeInsets.all(12),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 '${products?.name}',
  //                 maxLines: 2,
  //                 softWrap: true,
  //                 overflow: TextOverflow.ellipsis,
  //                 style: TextStyle(
  //                   fontSize: 14,
  //                 ),
  //               ),
  //               Row(
  //                 children: [
  //                   Text(
  //                     '${products?.price.round()}',
  //                     style: TextStyle(
  //                       color: Colors.blue,
  //                       fontSize: 16,
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     width: 6,
  //                   ),
  //                   if (products?.discount != 0)
  //                     Text(
  //                       '${products?.oldPrice.round()}',
  //                       style: const TextStyle(
  //                           color: Colors.grey,
  //                           decoration: TextDecoration.lineThrough,
  //                           decorationStyle: TextDecorationStyle.dashed),
  //                     ),
  //                   Spacer(),
  //                   IconButton(
  //                       onPressed: () {},
  //                       icon: Icon(
  //                         Icons.favorite_border,
  //                         size: 20,
  //                       ))
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
