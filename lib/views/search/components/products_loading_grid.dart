import 'package:flutter/material.dart';
import 'package:mbb/views/search/components/products_loading_cart.dart';

class ProductsLoadingGrid extends StatelessWidget {
  const ProductsLoadingGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(5),
      itemCount: 6,
      itemBuilder: (context, index) => const ProductsLoadingCart(),
    );
  }
}
