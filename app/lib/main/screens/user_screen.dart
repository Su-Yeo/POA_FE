import 'package:app/common/layout/base_layout.dart';
import 'package:app/common/model/demmy_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserScreen extends ConsumerStatefulWidget {
  const UserScreen({super.key});

  @override
  ConsumerState<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends ConsumerState<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      appBarTitle: Image.asset(
        'assets/icons/logo_short.png',
        fit: BoxFit.contain,
        width: 100,
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          _userInfo(),
          _listTile(),
        ],
      ),
    );
  }

  SliverPadding _userInfo() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            Image.asset(
              userModel[0].profileUrl,
              fit: BoxFit.cover,
              width: 150,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      userModel[0].name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      userModel[0].email,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ListTileContainer({
    required String title,
    required String path,
    required VoidCallback onTap,
    required bool hasTop,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: hasTop
              ? BorderSide(color: Colors.transparent, width: 0.0)
              : BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
          bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      child: ListTile(
        leading: Image.asset(path),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  SliverPadding _listTile() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 32.0,
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            _ListTileContainer(
              title: '구매 목록',
              path: 'assets/icons/user_buying.png',
              hasTop: false,
              onTap: () {
                context.go('/user/list');
                // context.go('/user/buying-list');
              },
            ),
            _ListTileContainer(
              title: '좋아요 목록',
              hasTop: true,
              path: 'assets/icons/user_like.png',
              onTap: () {},
            ),
            _ListTileContainer(
              title: '문의하기',
              hasTop: true,
              path: 'assets/icons/user_question.png',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
