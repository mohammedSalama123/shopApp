

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/modeles/home_model.dart';

class BannerView extends StatelessWidget {
  HomeModel? model;
  BannerView(this.model);

  @override
  Widget build(BuildContext context) {
    List<Widget> bannerList = [];
    model?.data?.banners?.forEach((element) {
      bannerList.add(
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.network(
            '${element.image}',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      );
    });

    return CarouselSlider(
      items: bannerList,
      options: CarouselOptions(
        height: 250,
        initialPage: 0,
        autoPlay: true,
        autoPlayAnimationDuration: Duration(seconds: 1),
        scrollDirection: Axis.horizontal,
        enableInfiniteScroll: true,
        reverse: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayCurve: Curves.bounceOut,
        viewportFraction: 1,
      ),
    );
  }
}
