import 'package:app/common/theme/color_schemes.g.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Art extends ConsumerWidget {
  final ValueNotifier themeNotifier;

  const Art({
    required this.themeNotifier,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> imageList = [
      'assets/images/image1.jpg',
      'assets/images/image2.jpg',
      'assets/images/image3.jpg',
    ];
    // final List<String> displayedArtUrls = artUrls ?? imageList;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                /* 작품 이미지 */
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.1,
                    viewportFraction: 1,
                  ),
                  items: imageList.map(
                    (imageUrl) {
                      return Builder(
                        builder: (BuildContext context) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              imageUrl,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      );
                    },
                  ).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      /* 작가 아바타 */
                      CircleAvatar(
                        radius: 15.0,
                        child: Image.asset('assets/images/avatar.png'),
                      ),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          /* 작가 이름 */
                          child: Text(
                            '포니어',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          '작가정보>',
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    /* 카테고리 */
                    Text(
                      '그림',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.grey,
                      ),
                    ),
                    /* 작품 타이틀 */
                    Text(
                      '삶의 아름다움',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    /* 작품 소개글 */
                    Text(
                      '문틈 너머로 바라본 창문 너머의 그림 문틈 너머로 바라본 창문 너머의 그림',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: themeNotifier.value == ThemeMode.light
                          ? Colors.white.withOpacity(0.8)
                          : Colors.black.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 8.0,
                  ),
                  /* 펀딩 여부 */
                  child: Text(
                    '펀딩중',
                    style: TextStyle(
                      color: themeNotifier.value == ThemeMode.light
                          ? lightColorScheme.primary
                          : darkColorScheme.primary,
                    ),
                  ),
                ),
              ),
              /* 찜 버튼 : 눌렀을 경우 붉은색으로 */
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
