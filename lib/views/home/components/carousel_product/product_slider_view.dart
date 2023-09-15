import 'package:flutter/material.dart';
import 'package:mbb/models/product_lists.dart';
import 'package:mbb/components/product_card.dart';

class PopularProduct extends StatelessWidget {
  final List<ProductLists> popularProducts;
  const PopularProduct({Key? key, required this.popularProducts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: popularProducts.length,
          itemBuilder: (context, index) =>
              ProductCard(product: popularProducts[index])),
    );
  }
}
