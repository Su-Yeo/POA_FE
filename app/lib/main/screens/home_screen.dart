import 'package:app/common/layout/base_layout.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      // needAppBar: false,
      appBarTitle: Image.asset(
        'assets/icons/logo_short.png',
        fit: BoxFit.contain,
        width: 100,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: CarouselSlider(
                  options: CarouselOptions(
                    // height: 400,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 1,
                    enlargeFactor: 0.4,
                    autoPlayCurve: Curves.ease,
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
                            child: Column(
                              children: [
                                Flexible(
                                  flex: 5,
                                  child: Card(
                                    elevation: 4,
                                    child: Image.asset(
                                      'assets/images/image${index}.jpg',
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  '사랑을 받는다',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '작가 정은혜',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          ),
          Image.asset(
            'assets/images/rail_lamp.png',
            fit: BoxFit.contain,
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}
