import 'package:app/categories/views/category_screen.dart';
import 'package:app/common/views/base_screen.dart';
import 'package:app/common/views/splash_screen.dart';
import 'package:app/home/views/home_screen.dart';
import 'package:app/user/views/user_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      /* 스플래시 스크린 */
      GoRoute(
        path: '/',
        builder: (context, state) => const CategoryScreen(),
        routes: <RouteBase>[
          /* 내정보 스크린 */
          GoRoute(
            path: 'info',
            builder: (BuildContext context, GoRouterState state) {
              // return const BaseScreen();
              return const UserInfoScreen();
            },
          ),
          /* 카테고리 스크린 */
          GoRoute(
            path: 'categories',
            builder: (context, state) => const CategoryScreen(),
          ),
        ],
      ),
    ],
  );
}
