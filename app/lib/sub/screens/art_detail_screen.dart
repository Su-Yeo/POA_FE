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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '작품 소개',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            _topArtInfo(
              context: context,
              imagePath: 'assets/images/image5.jpg',
              artTitle: '작품 타이틀',
              creator: '작가 금채민',
            ),
            _divider(),
            _midInfo(
              title: '작품 정보',
              content: '가격: ₩57,000\n 사이즈: 60 x 42cm',
            ),
            _divider(),
            _midInfo(
              title: '작품 소개',
              content:
                  '사람을 안아주는 게 좋아요 \n 사람을 안아주는 게 좋아요 \n 사람을 안아주는 게 좋아요\n 사람을 안아주는 게 좋아요',
            ),
            _divider(),
            _bottomInfo(
              btnPressed: () {
                context.go('/user/1');
              },
              title: '작가 정보',
              creator: '작가 금채민',
              index: 1,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  isLike = !isLike;
                });
              },
              child: Image.asset(
                !isLike
                    ? 'assets/icons/like_inactive.png'
                    : 'assets/icons/like_active.png',
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
                  backgroundColor: !isSoldOut ? Colors.black : Colors.grey,
                ),
                onPressed: isSoldOut
                    ? null
                    : () {
                        context.go('/gallary/1/paying');
                      },
                // onPressed: () {
                //   // !isSoldOut ? context.goNamed('') : null;
                // },
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
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
          Text(
            creator,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
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
          Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14.0,
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter _divider() {
    return SliverToBoxAdapter(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/icons/logo_short.png',
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
        ],
      ),
    );
  }
}
