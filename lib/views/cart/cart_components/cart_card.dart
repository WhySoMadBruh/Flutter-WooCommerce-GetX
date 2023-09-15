import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mbb/components/custom_stepper.dart';
import 'package:shimmer/shimmer.dart';

class CartCard extends StatelessWidget {
  final dynamic userId;
  final dynamic cartItemKey;
  final dynamic productId;
  final dynamic productName;
  final dynamic quantity;
  final dynamic productRegularPrice;
  final dynamic productSalePrice;
  final dynamic thumbnail;
  final dynamic lineSubtotal;
  final dynamic lineTotal;
  const CartCard({
    super.key,
    this.userId,
    this.cartItemKey,
    this.productId,
    this.productName,
    this.quantity,
    this.productRegularPrice,
    this.productSalePrice,
    this.thumbnail,
    this.lineSubtotal,
    this.lineTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: CachedNetworkImage(
                    imageUrl: thumbnail ?? "",
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.white,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: AspectRatio(
                            aspectRatio: 4 / 4,
                            child: Container(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productName ?? ""),
                    Text("₹$productRegularPrice"),
                  ],
                ),
              ),
            ],
          ),
          CustomStepper(
            lowerLimit: 0,
            upperLimit: 99,
            stepValue: 1,
            iconSize: 16,
            value: quantity,
            cartItemKey: cartItemKey,
            productId: productId,
            userId: userId,
            onChanged: (value) => quantity,
          )
        ],
      ),
    );
  }
}
