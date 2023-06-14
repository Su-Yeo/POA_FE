import 'package:app/common/const/format_amount.dart';
import 'package:app/common/model/art_work_model.dart';
import 'package:app/common/model/demmy_model.dart';
import 'package:app/common/providers/dio_provider.dart';
import 'package:app/common/theme/custom_theme.dart';
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
  Future getBuyingDetail(WidgetRef ref, int index) async {
    final dio = ref.watch(dioProvider);
    final resp = await dio.get(
      'http://ec2-44-203-136-252.compute-1.amazonaws.com/api/artwork/$index',
    );
    return resp.data;
  }

  @override
  Widget build(BuildContext context) {
    ArtWorkModel item;
    pathParam = int.parse(GoRouterState.of(context).pathParameters['index']!);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '구매하기',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
        future: getBuyingDetail(ref, pathParam),
        builder: (_, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }
          item = ArtWorkModel.fromJson(snapshot.data);
          return CustomScrollView(
            slivers: [
              _topInfo(item),
              _divider(),
              _bottomMessage(),
            ],
          );
        },
      ),
    );
  }

  SliverToBoxAdapter _divider() {
    return const SliverToBoxAdapter(
      child: Divider(),
    );
  }

  SliverToBoxAdapter _topInfo(ArtWorkModel item) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(
              item.fileUrl,
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
                    item.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    '작가정보: ${item.userName}',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[500],
                    ),
                  ),
                  Text(
                    '작품가격: ${formatAmount(item.artworkPrice.toString())}',
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
