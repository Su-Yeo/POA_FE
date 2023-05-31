import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Art extends ConsumerWidget {
  const Art({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            4.0,
          ),
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Card(
                  elevation: 4,
                  child: Image.asset(
                    'assets/images/image3.jpg',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                '무지개 놀이',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '작가 김포아',
              ),
              Text(
                '57,000원',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
