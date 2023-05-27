import 'package:app/categories/views/category_screen.dart';
import 'package:app/common/views/base_screen.dart';
import 'package:app/common/views/splash_screen.dart';
import 'package:app/home/views/home_screen.dart';
import 'package:app/user/views/user_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final ValueNotifier<ThemeMode> themeNotifier;
  final GoRouter router;

/* 클래서 생성자에서 themeMotifier를 받은 후, 인스턴스 변수로 할당 */
  AppRouter({
    required this.themeNotifier,
  }) : router = GoRouter(
          routes: <RouteBase>[
            /* 스플래시 스크린 */
            GoRoute(
              path: '/',
              builder: (context, state) => SplashScreen(
                themeNotifier: themeNotifier,
              ),
              routes: <RouteBase>[
                /* 베이스 스크린(홈) */
                GoRoute(
                  path: 'home',
                  builder: (context, state) => BaseScreen(
                    themeNotifier: themeNotifier,
                  ),
                ),
                /* 카테고리 스크린 */
                GoRoute(
                  path: 'categories',
                  builder: (context, state) => const CategoryScreen(),
                ),
                /* 내정보 스크린 */
                GoRoute(
                  path: 'info',
                  builder: (context, state) => const UserInfoScreen(),
                ),
              ],
            ),
          ],
        );
  // GoRouter get router => router;
}
