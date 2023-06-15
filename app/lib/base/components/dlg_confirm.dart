import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DlgConfirm extends ConsumerWidget {
  final VoidCallback onConfirm;
  const DlgConfirm({
    super.key,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(32.0),
      content: const Text(
        '정말 구매하시겠습니까?',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(), // 닫기 버튼
          // style: ButtonStyle(
          //   padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          //     EdgeInsets.zero, // 패딩을 없애기 위해 EdgeInsets.zero 설정
          //   ),
          // ),
          child: const Text(
            '아니오',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
        TextButton(
          // style: ButtonStyle(
          //   padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          //     EdgeInsets.zero,
          //   ),
          // ),
          onPressed: onConfirm, // 구매하기 버튼
          child: const Text(
            '네',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
