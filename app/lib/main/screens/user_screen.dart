import 'package:app/common/layout/base_layout.dart';
import 'package:app/common/model/user_model.dart';
import 'package:app/common/providers/dio_provider.dart';
import 'package:app/common/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserScreen extends ConsumerStatefulWidget {
  const UserScreen({super.key});

  @override
  ConsumerState<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends ConsumerState<UserScreen> {
  Future getUser(WidgetRef ref, int value) async {
    final dio = ref.watch(dioProvider);
    final resp = await dio.get(
      'http://ec2-44-203-136-252.compute-1.amazonaws.com/api/findUser/$value',
    );
    return resp.data;
  }

  @override
  Widget build(BuildContext context) {
    UserModel items;
    return BaseLayout(
      appBarTitle: Image.asset(
        'assets/icons/logo_short.png',
        fit: BoxFit.contain,
        width: 100,
      ),
      body: FutureBuilder(
        future: getUser(ref, 2),
        builder: (_, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }
          items = UserModel.fromJson(snapshot.data);

          return CustomScrollView(
            shrinkWrap: true,
            slivers: [
              _userInfo(items),
              _listTile(),
            ],
          );
        },
      ),
    );
  }

  SliverPadding _userInfo(UserModel items) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            Image.network(
              items.profileUrl,
              fit: BoxFit.cover,
              width: 150,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      items.name,
                      style: const TextStyle(
                        color: primaryColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      items.email,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: const TextStyle(
                        color: primaryColor,
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

  Widget _listTileContainer({
    required String title,
    required String path,
    required VoidCallback onTap,
    required bool hasTop,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: hasTop
              ? const BorderSide(
                  color: Colors.transparent,
                  width: 0.0,
                )
              : const BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
          bottom: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      child: ListTile(
        leading: Image.asset(path),
        title: Text(
          title,
          style: const TextStyle(
            color: primaryColor,
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  SliverPadding _listTile() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 32.0,
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            _listTileContainer(
              title: '구매 목록',
              path: 'assets/icons/user_buying.png',
              hasTop: false,
              onTap: () {
                context.go('/user/list');
              },
            ),
            _listTileContainer(
              title: '좋아요 목록',
              hasTop: true,
              path: 'assets/icons/user_like.png',
              onTap: () {},
            ),
            _listTileContainer(
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
