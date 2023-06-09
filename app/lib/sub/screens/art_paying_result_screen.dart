import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArtPayingResultScreen extends ConsumerStatefulWidget {
  const ArtPayingResultScreen({super.key});

  @override
  ConsumerState<ArtPayingResultScreen> createState() =>
      _ArtPayingResultScreenState();
}

class _ArtPayingResultScreenState extends ConsumerState<ArtPayingResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '구매하기',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          _topInfo(),
          _divider(),
          _bottomMessage(),
        ],
      ),
    );
  }

  SliverToBoxAdapter _divider() {
    return const SliverToBoxAdapter(
      child: Divider(),
    );
  }

  SliverToBoxAdapter _topInfo() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              'assets/images/image1.jpg',
              fit: BoxFit.contain,
              width: 150,
              height: 150,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '사랑을 받는다',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    '작가정보: 정은혜',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[500],
                    ),
                  ),
                  Text(
                    '작품가격: 85,000원',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _bottomMessage() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 24.0,
            ),
            Text(
              '구매 완료 되었습니다.',
              style: TextStyle(
                color: Colors.red,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Text(
              '독자님의 응원이 독자님께 큰 힘이 됩니다.',
            ),
          ],
        ),
      ),
    );
  }
}
