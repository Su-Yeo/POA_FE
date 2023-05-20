import 'package:app/common/components/arts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        _sliverGrid(),
        // _sliverList(),
      ],
    );
  }

  SliverGrid _sliverGrid() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 한 줄에 표시할 위젯 수
        mainAxisSpacing: 5.0, // 수직 간격
        crossAxisSpacing: 5.0, // 수평 간격
        childAspectRatio: MediaQuery.of(context).size.height *
            0.7 /
            MediaQuery.of(context).size.height,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Arts(
            themeNotifier: widget.themeNotifier,
          );
        },
        childCount: 5, // 전체 위젯 수
      ),
    );
  }

  SliverList _sliverList() {
    final rainbowColors = [
      0xff0000,
      0xff9900,
      0xfbff00,
      0x88ff00,
      0x00c3ff,
      0x0008ff,
      0xa200ff,
    ];
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 20,
        (context, index) {
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index,
          );
        },
      ),
    );
  }

  Widget renderContainer({
    required int color,
    required int index,
  }) {
    return Container(
      height: 100,
      color: Color(color),
      child: Center(
        child: Text(index.toString()),
      ),
    );
  }
}
