import 'package:fe/arts/components/art.dart';
import 'package:fe/common/layout/base_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ArtsScreen extends StatefulWidget {
  const ArtsScreen({super.key});

  @override
  State<ArtsScreen> createState() => _ArtsScreenState();
}

class _ArtsScreenState extends State<ArtsScreen> {
  @override
  Widget build(BuildContext context) {
    final ScrollController _controller = ScrollController();
    List<bool> isSelected = [true, false, false];

    Container _btn({required String btnTitle}) {
      return Container(
        decoration: BoxDecoration(
          // color: Colors.black,
          borderRadius: BorderRadius.circular(4),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 12.0,
        ),
        /* 펀딩 여부 */
        child: Text(
          btnTitle,
          // style: TextStyle(
          //   color: Colors.white,
          // ),
        ),
      );
    }

    return BaseLayout(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToggleButtons(
                isSelected: isSelected,
                onPressed: (int index) {
                  setState(() {
                    isSelected[index] = !isSelected[index];
                  });
                },
                children: [
                  _btn(btnTitle: '최신순'),
                  _btn(btnTitle: '최신순'),
                  _btn(btnTitle: '최신순'),
                ],
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 42.0,
                vertical: 16.0,
              ),
              child: ListView.builder(
                controller: _controller,
                // shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  print(index);
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: Art(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
