import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(
              child: Text('내정보'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => context.go('/info'),
                child: Text('다음'),
              ),
              ElevatedButton(
                onPressed: () => context.pop(),
                child: Text('이전'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
