import 'package:app/common/layout/base_layout.dart';
import 'package:app/common/model/demmy_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      appBarTitle: Image.asset(
        'assets/icons/logo_short.png',
        fit: BoxFit.contain,
        width: 100,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Expanded(
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 3 / 4,
                    enlargeFactor: 0.3,
                    autoPlayCurve: Curves.decelerate,
                    viewportFraction: 0.7,
                    autoPlayAnimationDuration: const Duration(
                      seconds: 3,
                    ),
                  ),
                  items: models.map(
                    (data) {
                      return GestureDetector(
                        onTap: () {
                          context.go('/gallary/${data.artworkId}');
                        },
                        child: Column(
                          children: [
                            Flexible(
                              flex: 5,
                              child: Card(
                                elevation: 4,
                                child: Image.asset(
                                  data.fileUrl,
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Text(
                              data.title,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '작가 ${data.creator}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
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
