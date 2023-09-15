import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductsLoadingCart extends StatelessWidget {
  const ProductsLoadingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      shadowColor: Colors.grey.shade200,
      borderRadius: const BorderRadius.all(Radius.circular(1)),
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: Column(
          children: [
            Flexible(
              flex: 5,
              child: Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.grey,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 20,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 15,
                    width: 75,
                    color: Colors.grey.shade300,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
