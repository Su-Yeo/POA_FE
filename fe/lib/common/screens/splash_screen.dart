import 'package:fe/common/layout/base_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static String get routeName => 'splash';
  const SplashScreen({
    super.key,
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
  }

  // 모든 토큰 지우기
  void deleteToken() async {}

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_long.png',
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
