import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryLoading extends StatelessWidget {
  const CategoryLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: Row(children: [
        Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        const SizedBox(
          height: 8,
        ),
      ]),
    );
  }
}
