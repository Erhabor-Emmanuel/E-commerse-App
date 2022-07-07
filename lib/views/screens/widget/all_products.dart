import 'package:flutter/material.dart';

import '../../../models/clothes.dart';

class AllProducts extends StatelessWidget {
  final clothesList = Clothes.generateClothes();
  const AllProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 280,
            child: ListView.separated(
                itemBuilder: itemBuilder,
                separatorBuilder: separatorBuilder,
                itemCount: itemCount),
          ),
        ],
      ),
    );
  }
}
