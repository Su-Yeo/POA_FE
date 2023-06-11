import 'package:app/common/const/format_amount.dart';
import 'package:app/common/model/demmy_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ArtPayingResultScreen extends ConsumerStatefulWidget {
  const ArtPayingResultScreen({super.key});

  @override
  ConsumerState<ArtPayingResultScreen> createState() =>
      _ArtPayingResultScreenState();
}

class _ArtPayingResultScreenState extends ConsumerState<ArtPayingResultScreen> {
  int pathParam = 0;

  @override
  Widget build(BuildContext context) {
    pathParam = int.parse(GoRouterState.of(context).pathParameters['index']!);
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
              models[pathParam].fileUrl,
              fit: BoxFit.contain,
              width: 150,
              height: 150,
            ),
            SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    models[pathParam].title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    '작가정보: ${models[pathParam].creator}',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[500],
                    ),
                  ),
                  Text(
                    '작품가격: ${formatAmount(models[pathParam].artworkPrice.toString())}',
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
            const SizedBox(
              height: 24.0,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/gallary');
                    },
                    child: Text(
                      '확인',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          4.0,
                        ),
                      ),
                      backgroundColor: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
