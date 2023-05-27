import 'package:app/common/layout/base_layout.dart';
import 'package:app/common/theme/color_schemes.g.dart';
import 'package:app/common/views/base_screen.dart';
import 'package:app/home/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static String get routeName => 'splash';
  final ValueNotifier themeNotifier;
  const SplashScreen({
    super.key,
    required this.themeNotifier,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  // 1. Splash Screen 에서 유저의 토큰 체크
  // jwt token 정보를 secureStorage에 보관
  @override
  void initState() {
    super.initState();
    deleteToken();
    checkToken();
  }

  // 앱 시작 시 checkToken
  // 일단은 3초 후에 Navigator 적용
  Future<void> checkToken() async {
    return Future.delayed(
      Duration(milliseconds: 3000),
    ).then(
      (value) => context.go('/home'),
    );
    //   Navigator.of(context).pushAndRemoveUntil(
    //     MaterialPageRoute(
    //       builder: (_) => BaseScreen(
    //         themeNotifier: widget.themeNotifier,
    //       ),
    //     ),
    //     (route) => false,
    //   ),
    // });
  }

  // 모든 토큰 지우기
  void deleteToken() async {}

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      backgrondColor: widget.themeNotifier!.value == ThemeMode.light
          ? lightColorScheme.onBackground
          : darkColorScheme.onBackground,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/illu14.png',
              width: MediaQuery.of(context).size.width / 2,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
