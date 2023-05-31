import 'package:carousel_slider/carousel_slider.dart';
import 'package:fe/common/layout/base_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> imageList = [
      'assets/images/image1.png',
      'assets/images/image2.jpg',
      'assets/images/image3.jpeg',
    ];
    return BaseLayout(
      body: Column(
        children: [
          // 상단의 레일
          Image.asset(
            'assets/images/rail_lamp.png',
            fit: BoxFit.contain,
            width: MediaQuery.of(context).size.width,
          ),
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 1,
                enlargeFactor: 0.4,
                viewportFraction: 0.7,
                autoPlayAnimationDuration: Duration(
                  seconds: 1,
                ),
              ),
              items: [1, 2, 3, 4, 5].map(
                (index) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          print(index);
                        },
                        child: Card(
                          elevation: 4.0,
                          child: Image.asset(
                            'assets/images/image${index}.jpg',
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                      );
                    },
                  );
                },
              ).toList(),
            ),
          ),
          Text(
            '사랑을 받는다',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '작가 정은혜',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
      //   body: Container(
      //     color: Colors.amber,
      //     child: Center(
      //       child: Text(
      //         GoRouterState.of(context).location.toString(),
      //       ),
      //     ),
      //   ),
    );
  }
}
