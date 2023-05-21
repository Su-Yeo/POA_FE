import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArtsDetail extends ConsumerWidget {
  final String? writerName;
  final String? artName;
  final String? artDescription;
  final int? percentage;
  final String? period;

  const ArtsDetail({
    Key? key,
    this.writerName,
    this.artName,
    this.artDescription,
    this.percentage,
    this.period,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Art Detail'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Writer: $writerName',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Art Name: $artName',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Description: $artDescription',
              style: TextStyle(fontSize: 14.0),
            ),
            Text(
              'Percentage: $percentage',
              style: TextStyle(fontSize: 14.0),
            ),
            Text(
              'Period: $period',
              style: TextStyle(fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}
