import 'package:app/common/layout/base_layout.dart';
import 'package:app/common/model/art_work_model.dart';
import 'package:app/common/providers/dio_provider.dart';
import 'package:app/common/theme/custom_theme.dart';
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
  Future getArts(WidgetRef ref) async {
    final dio = ref.watch(dioProvider);
    final resp = await dio.get(
      'http://ec2-44-203-136-252.compute-1.amazonaws.com/api/artwork/home',
    );
    return resp.data;
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      appBarTitle: Image.asset(
        'assets/icons/logo_short.png',
        fit: BoxFit.contain,
        width: 100,
      ),
      body: FutureBuilder(
        future: getArts(ref),
        builder: (_, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }
          return Stack(
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
                      items: snapshot.data.map<Widget>(
                        (data) {
                          final item = ArtWorkModel.fromJson(data);
                          return GestureDetector(
                            onTap: () {
                              context.go('/gallary/${item.artworkId}');
                            },
                            child: Column(
                              children: [
                                Flexible(
                                  flex: 5,
                                  child: Card(
                                    elevation: 4,
                                    child: Image.network(
                                      item.fileUrl,
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  item.title,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '작가 ${item.userName}',
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
          );
        },
      ),
    );
  }
}
