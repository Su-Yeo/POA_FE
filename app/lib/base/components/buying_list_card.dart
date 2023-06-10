import 'package:app/common/model/demmy_model.dart';
import 'package:app/common/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class BuyingListCard extends StatelessWidget {
  const BuyingListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '배송준비중',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            IntrinsicHeight(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                    child: Image.asset(
                      models[0].fileUrl,
                      fit: BoxFit.cover,
                      width: 70,
                      height: 70,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            '그림',
                            style: TextStyle(
                              color: lineColor,
                              fontSize: 12.0,
                            ),
                          ),
                          Text(
                            models[0].title,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '작가 ${models[0].creator}',
                            style: TextStyle(
                              color: lineColor,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              '2022.05.11 결제',
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 10.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
