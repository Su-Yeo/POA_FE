import 'package:app/common/layout/base_layout.dart';
import 'package:app/common/theme/custom_theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseScreen extends ConsumerStatefulWidget {
  static String get routeName => 'base';

  const BaseScreen({
    super.key,
  });

  @override
  ConsumerState<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends ConsumerState<BaseScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int index = 0;
  bool isSearch = false;
  List tabName = ['홈', '찜', '검색', '구독', '내정보'];
  List tabIcon = [
    Icons.home,
    Icons.favorite,
    Icons.youtube_searched_for_sharp,
    Icons.bookmark_border,
    Icons.manage_accounts_rounded,
  ];
  String searchText = '';

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
      // title: isSearch
      //     ? AnimatedOpacity(
      //         opacity: isSearch ? 1.0 : 0.0,
      //         duration: const Duration(milliseconds: 2000),
      //         curve: Curves.bounceInOut,
      //         child: searchBar(),
      //       )
      //     : Text(
      //         tabName[index],
      //         style: const TextStyle(
      //           fontSize: 16.0,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      body: TabBarView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            child: Center(
              child: Text('검색'),
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
      // body: HomeScreen(
      //   themeNotifier: widget.themeNotifier,
      //   controller: controller,
      // ),
      bottomNav: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
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
