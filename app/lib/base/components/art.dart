import 'package:app/common/model/art_work_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Art extends ConsumerWidget {
  final ArtWorkModel model;
  const Art({
    super.key,
    required this.model,
  });

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
                  child: Image.network(
                    model.fileUrl,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                model.title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '작가 ${model.userName}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
