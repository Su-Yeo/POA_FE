import 'package:app/common/theme/color_schemes.g.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Arts extends ConsumerWidget {
  final ValueNotifier themeNotifier;
  const Arts({
    super.key,
    required this.themeNotifier,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> imageList = [
      'assets/images/image1.jpg',
      'assets/images/image2.jpg',
      'assets/images/image3.jpg',
    ];
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[50],
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4.0,
                    ),
                    /* 작가 아바타 */
                    child: CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage(
                        'assets/images/avatar14.png',
                      ),
                    ),
                  ),
                  /* 작가 이름 */
                  Text(
                    '전은정',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              /* 버튼 */
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add_reaction_rounded,
                  size: 15,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                /* 작품 사진 */
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                  items: imageList.map((imageUrl) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Image.asset(
                          imageUrl,
                          fit: BoxFit.cover,
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /* 작품 이름 */
                Text(
                  '밤잠을 솔솔 오게하는 향초',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                /* 좋아요 하트 */
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 8.0,
              left: 4.0,
              right: 4.0,
            ),
            child: Row(
              children: [
                Expanded(
                  /* 작품 설명 */
                  child: Text(
                    '이 작품에 대한 설명입니다. 이 작품에 대한 설명입니다. 이 작품에 대한 설명입니다. 이 작품에 대한 설명입니다. 이 작품에 대한 설명입니다. 이 작품에 대한 설명입니다. 이 작품에 대한 설명입니다. 이 작품에 대한 설명입니다. 이 작품에 대한 설명입니다. 이 작품에 대한 설명입니다. 이 작품에 대한 설명입니다. 이 작품에 대한 설명입니다.',
                    style: TextStyle(
                      fontSize: 10.0,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          /* 펀딩 상황 */
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: FundingStatusBar(
                    percentage: 75,
                    period: '2023.05.20. ~ 2023.06.20.',
                    themeNotifier: themeNotifier,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FundingStatusBar extends ConsumerWidget {
  final double percentage;
  final String period;
  final ValueNotifier themeNotifier;
  const FundingStatusBar({
    super.key,
    required this.percentage,
    required this.period,
    required this.themeNotifier,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                period,
                style: TextStyle(
                  fontSize: 8.0,
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 8.0,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0 / 2),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.bottomLeft,
                widthFactor: percentage / 100,
                child: Container(
                  decoration: BoxDecoration(
                    color: themeNotifier.value == ThemeMode.light
                        ? lightColorScheme.primary
                        : darkColorScheme.primary,
                    borderRadius: BorderRadius.circular(20.0 / 2),
                  ),
                ),
              ),
            ),
            Text(
              '${percentage.toString()}% 달성 중이예요',
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
                color: themeNotifier.value == ThemeMode.light
                    ? lightColorScheme.primary
                    : darkColorScheme.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
