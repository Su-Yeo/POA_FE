import 'package:app/arts/components/arts_detail.dart';
import 'package:app/common/theme/color_schemes.g.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Arts extends ConsumerWidget {
  final ValueNotifier themeNotifier;
  final String? writerName; // 작가 이름
  final String? writerAvater; // 작가 아바타
  final List<String>? artUrls; // 작품 이미지
  final int? percentage; // 펀딩 percentage
  final String? period; // 펀딩기간
  final String? artName; // 작품이름
  final String? artDescription; // 작품소개
  const Arts({
    super.key,
    required this.themeNotifier,
    this.writerName = '',
    this.writerAvater = '',
    this.artUrls,
    this.percentage = 0,
    this.period = '',
    this.artName = '',
    this.artDescription = '',
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> imageList = [
      'assets/images/image1.jpg',
      'assets/images/image2.jpg',
      'assets/images/image3.jpg',
    ];
    final List<String> displayedArtUrls = artUrls ?? imageList;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArtsDetail(
              writerName: writerName,
              artName: artName,
              artDescription: artDescription,
              percentage: percentage,
              period: period,
            ),
          ),
        );
      },
      child: Container(
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
                        radius: 10,
                        backgroundImage: AssetImage(
                          writerAvater == ''
                              ? 'assets/images/avatar.png'
                              : writerAvater!,
                        ),
                      ),
                    ),
                    /* 작가 이름 */
                    Text(
                      writerName!,
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                /* 버튼 */
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_reaction_rounded,
                    size: 15,
                  ),
                ),
              ],
            ),
            Expanded(
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: displayedArtUrls.map(
                  (imageUrl) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Image.asset(
                          imageUrl,
                          fit: BoxFit.cover,
                        );
                      },
                    );
                  },
                ).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /* 작품 이름 */
                  Text(
                    artName!,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  /* 좋아요 하트 */
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
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
                      artDescription!,
                      style: const TextStyle(
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
                    child: fundingStatusBar(percentage!, period!, context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget fundingStatusBar(int percentage, String period, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                period == '' ? '펀딩 기간이 아닙니다' : period,
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
              percentage == 0
                  ? '펀딩 작품이 아닙니다.'
                  : '${percentage.toString()}% 달성 중이예요',
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
