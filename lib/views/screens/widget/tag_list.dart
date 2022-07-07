import 'package:flutter/material.dart';

class TagList extends StatelessWidget {
  TagList({Key? key}) : super(key: key);

  final tagList = [
    'Woman',
    'T-shirts',
    'Dress',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: tagList
          .map((e) => Container(
        margin: const EdgeInsets.all(14),
        padding: const EdgeInsets.all(10),
                child: Text(
                  e,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ))
          .toList(),
    );
  }
}
