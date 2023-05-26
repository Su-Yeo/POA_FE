import 'package:app/arts/components/art.dart';
import 'package:app/common/theme/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static String get routeName => 'home';
  final ValueNotifier themeNotifier;
  const HomeScreen({
    super.key,
    required this.themeNotifier,
  });

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  ScrollController controller = ScrollController();
  List<String> items = List.generate(10, (index) => 'Item $index');
  int visibleItemCount = 4;
  bool showMoreButton = true;

  void loadMoreItems() {
    setState(() {
      if (visibleItemCount + 4 >= items.length) {
        visibleItemCount = items.length;
        showMoreButton = false;
      } else {
        visibleItemCount += 4;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        _topPoaArea(),
        _midTimeSet(),
        _sliverGrid(),
        // _sliverList(),
      ],
    );
  }

  // POA Story
  SliverPadding _topPoaArea() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      sliver: SliverToBoxAdapter(
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: renderContainerWithTitle(
                  height: 300,
                  // child: Image.asset(
                  //   'assets/images/image2.jpg',
                  //   fit: BoxFit.cover,
                  // ),
                  text: 'PoA Story',
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    renderContainerWithTitle(
                      height: 150,
                      // child: Image.asset(
                      //   'assets/images/image2.jpg',
                      //   fit: BoxFit.cover,
                      // ),
                      color: Colors.grey,
                      text: 'PoA Guide',
                    ),
                    renderContainerWithTitle(
                      height: 150,
                      // child: Image.asset(
                      //   'assets/images/image1.jpg',
                      //   fit: BoxFit.cover,
                      // ),
                      color: Colors.green,
                      text: 'PoA Together',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Time Set
  SliverPadding _midTimeSet() {
    return SliverPadding(
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 16.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Text(
              'Check now! 오늘 펀딩 마감',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('00 : 00 : 00'),
            Text(
              '오늘까지 마감인 펀딩 작품들 입니다. 늦지 않게 응원해주세요!',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverGrid _sliverGrid() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 한 줄에 표시할 위젯 수
        mainAxisSpacing: 10.0, // 수직 간격
        crossAxisSpacing: 10.0, // 수평 간격
        childAspectRatio: MediaQuery.of(context).size.height *
            0.7 /
            MediaQuery.of(context).size.height,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index == visibleItemCount) {
            return showMoreButton
                ? ElevatedButton(
                    onPressed: loadMoreItems,
                    child: Text('더보기'),
                  )
                : null;
          }
          return Art(
            themeNotifier: widget.themeNotifier!,
          );
        },
        // childCount: 5, // 전체 위젯 수
        childCount: visibleItemCount + 1,
      ),
    );
  }

  // SliverList _sliverList() {
  //   final rainbowColors = [
  //     0xff0000,
  //     0xff9900,
  //     0xfbff00,
  //     0x88ff00,
  //     0x00c3ff,
  //     0x0008ff,
  //     0xa200ff,
  //   ];
  //   return SliverList(
  //     delegate: SliverChildBuilderDelegate(
  //       childCount: 20,
  //       (context, index) {
  //         return renderContainer(
  //           color: rainbowColors[index % rainbowColors.length],
  //           index: index,
  //         );
  //       },
  //     ),
  //   );
  // }

  // Widget renderContainer({
  //   required int color,
  //   required int index,
  // }) {
  //   return Container(
  //     height: 100,
  //     color: Color(color),
  //     child: Center(
  //       child: Text(index.toString()),
  //     ),
  //   );
  // }

  Widget renderContainerWithTitle({
    double? height,
    Widget? child,
    required String text,
    Color? color,
  }) {
    return Container(
      height: height ?? 100,
      color: color ?? darkColorScheme.primary,
      child: Stack(
        children: [
          child ?? Container(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text!,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
