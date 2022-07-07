import 'package:ecommerce_app/models/clothes.dart';
import 'package:ecommerce_app/views/screens/widget/category_list.dart';
import 'package:ecommerce_app/views/screens/widget/customApp_bar.dart';
import 'package:ecommerce_app/views/screens/widget/products.dart';
import 'package:ecommerce_app/views/screens/widget/search_input.dart';
import 'package:ecommerce_app/views/screens/widget/tag_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CustomAppBar(),
        SearchInput(),
        TagList(),
        CategoryList(),
        ProductItem(
          clothes: Clothes(
            'Gucci oversize',
            '\$70.99',
            'assets/images/arrival1.png',
          ),
        )
      ]),
    );
  }
}
