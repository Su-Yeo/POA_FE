import 'package:app/common/const/format_amount.dart';
import 'package:app/common/model/art_work_model.dart';
import 'package:app/common/providers/dio_provider.dart';
import 'package:app/common/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ArtDetailScreen extends ConsumerStatefulWidget {
  const ArtDetailScreen({super.key});

  @override
  ConsumerState<ArtDetailScreen> createState() => _ArtDetailScreenState();
}

class _ArtDetailScreenState extends ConsumerState<ArtDetailScreen> {
  bool isLike = false;
  bool isSoldOut = false;
  int pathParam = 0;
  int userId = 0;

  // 스낵바
  void showSnackbar(BuildContext context, String message) {
    final snackbar = SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(
        seconds: 2,
      ),
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  Future getArtDetail(WidgetRef ref, int index) async {
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
          '작품 소개',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
        future: getArtDetail(ref, pathParam),
        builder: (_, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }
          item = ArtWorkModel.fromJson(snapshot.data);
          userId = item.artworkId;
          isLike = item.like;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomScrollView(
              shrinkWrap: true,
              slivers: [
                _topArtInfo(
                  context: context,
                  imagePath: item.fileUrl,
                  artTitle: item.title,
                  creator: '작가 ${item.userName}',
                ),
                _divider(),
                _midInfo(
                  title: '작품 정보',
                  content:
                      '가격: ${formatAmount(item.artworkPrice.toString())}\n사이즈: ${item.artworkSize}',
                ),
                _divider(),
                _midInfo(
                  title: '작품 소개',
                  content: item.content,
                ),
                _divider(),
                _bottomInfo(
                  btnPressed: () {
                    context.go('/user/${item.userId}');
                  },
                  title: '작가 정보',
                  creator: '작가 ${item.userName}',
                  index: 1,
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  isLike = !isLike;
                  isLike
                      ? showSnackbar(
                          context,
                          '작가님께 응원의 메세지를 보내드릴게요!',
                        )
                      : showSnackbar(
                          context,
                          '응원을 취소했습니다',
                        );
                });
              },
              child: Image.asset(
                isLike
                    ? 'assets/icons/like_active.png'
                    : 'assets/icons/like_inactive.png',
                fit: BoxFit.cover,
                width: 40,
              ),
            ),
            TextButton(
              onPressed: () {
                // Share 창 열리기
              },
              child: Image.asset(
                'assets/icons/share.png',
                fit: BoxFit.cover,
                width: 40,
              ),
            ),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      4.0,
                    ),
                  ),
                  backgroundColor: !isSoldOut ? Colors.black : Colors.grey,
                ),
                onPressed: isSoldOut
                    ? null
                    : () {
                        context.go('/gallary/$userId/paying');
                      },
                child: Text(
                  !isSoldOut ? '구매하기' : '판매완료',
                  style: TextStyle(
                    color: !isSoldOut ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _topArtInfo({
    required BuildContext context,
    required String imagePath,
    required String artTitle,
    required String creator,
  }) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Image.network(
            imagePath,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: 350,
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            artTitle,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            creator,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter _midInfo({
    required String title,
    required String content,
  }) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 4.0,
            ),
            child: Text(
              content,
              style: const TextStyle(
                fontSize: 14.0,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter _divider() {
    return const SliverToBoxAdapter(
      child: Divider(),
    );
  }

  SliverToBoxAdapter _bottomInfo({
    required String title,
    required String creator,
    required int index,
    required VoidCallback btnPressed,
  }) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w800,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/icons/active_poa.png',
                  fit: BoxFit.cover,
                  width: 50,
                ),
                const SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: Text(
                    creator,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: btnPressed,
                  child: const Text(
                    '바로가기 >',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
