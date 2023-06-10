import 'package:app/common/layout/base_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    deleteToken();
    checkToken();
  }

  // 모든 토큰 지우기
  void deleteToken() async {}

  // 앱 시작시 CheckToken
  Future<void> checkToken() async {
    return Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
    ).then(
      (value) => context.go(
        '/home',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/logo_long.png',
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
