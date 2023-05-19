import 'package:app/common/layout/base_layout.dart';
import 'package:app/common/theme/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseScreen extends ConsumerStatefulWidget {
  static String get routeName => 'base';
  final ValueNotifier themeNotifier;
  const BaseScreen({
    super.key,
    required this.themeNotifier,
  });

  @override
  ConsumerState<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends ConsumerState<BaseScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int index = 0;
  final List tabName = ['홈', '찜', '검색', '구독', '내정보'];
  final List tabIcon = [
    Icons.home,
    Icons.favorite,
    Icons.youtube_searched_for_sharp,
    Icons.bookmark_border,
    Icons.manage_accounts_rounded,
  ];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: tabName.length, vsync: this);
    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: tabName[index],
      actionIcon: widget.themeNotifier.value == ThemeMode.light
          ? Icons.nightlight_round_rounded
          : Icons.sunny,
      actionPressed: () {
        widget.themeNotifier.value =
            widget.themeNotifier.value == ThemeMode.light
                ? ThemeMode.dark
                : ThemeMode.light;
      },
      body: TabBarView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            child: Center(
              child: Text('홈'),
            ),
          ),
          Container(
            child: Center(
              child: Text('찜'),
            ),
          ),
          Container(
            child: Center(
              child: Text('검색'),
            ),
          ),
          Container(
            child: Center(
              child: Text('구독'),
            ),
          ),
          Container(
            child: Center(
              child: Text('내정보'),
            ),
          ),
        ],
      ),
      bottomNav: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: widget.themeNotifier.value == ThemeMode.light
            ? lightColorScheme.primary
            : darkColorScheme.primary,
        onTap: (int index) {
          controller.animateTo(index);
        },
        currentIndex: index,
        items: List.generate(
          tabName.length,
          (index) => BottomNavigationBarItem(
            icon: Icon(tabIcon[index]),
            label: tabName[index],
          ),
        ),
      ),
    );
  }
}
