import 'package:app/base/components/buying_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserBuyingListScreen extends ConsumerWidget {
  const UserBuyingListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController _controller = ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '구매목록',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 8.0,
            ),
            child: Text(
              '나의 구매목록(1)',
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                print('1');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  // vertical: 4.0,
                ),
                child: ListView.builder(
                  controller: _controller,
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.0,
                      ),
                      child: BuyingListCard(),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
