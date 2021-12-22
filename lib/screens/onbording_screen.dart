import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shop_app/modeles/onbordingmodel.dart';
import 'package:shop_app/screens/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBordingScreen extends StatefulWidget {
  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  List<OnBordingModel> onBording = [
    OnBordingModel(
        image: 'assets/images/onlin_shoping_onbording.png',
        title: 'Online shopping',
        description:
            'Women Fashion Shopping Online - Shop from a huge range of latest women clothing, shoes, makeup Kits, Watches, footwear and more for women at best price'),
    OnBordingModel(
        image: 'assets/images/addcart_onbording.png',
        title: 'add Cart',
        description:
            'Add to cart button works on product pages. The customizations in this section  compatible with dynamic checkout buttons'),
    OnBordingModel(
        image: 'assets/images/payment_onbording.png',
        title: 'payment Successful',
        description:
            'Your payment has been successfully completed. You will receive a confirmation email within a few minutes. '),
  ];

  var bordingController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                      (route) => false,
                );
              },
              child: const Text(
                'Skip',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color(0xff170C51)),
              )),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    return buildBording(onBording[index]);
                  },
                  itemCount: onBording.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  controller: bordingController,
                  onPageChanged: (int index) {
                    if (index == onBording.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                child: const Text('Netx'),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff170C51),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  bordingController.nextPage(
                      duration: const Duration(
                        milliseconds: 800,
                      ),
                      curve: Curves.decelerate);
                  if (isLast) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                      (route) => false,
                    );
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              SmoothPageIndicator(
                controller: bordingController,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Color(0xff170C51),
                  dotColor: Colors.grey,
                  dotHeight: 10,
                  dotWidth: 20,
                  spacing: 20,
                  radius: 12,
                ),
                count: onBording.length,
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBording(OnBordingModel onBordingModel) {
    return Column(
      children: [
        Expanded(
          child: Image(
            image: AssetImage(onBordingModel.image),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          onBordingModel.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          onBordingModel.description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
