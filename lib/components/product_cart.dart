import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbb/controller/cart_controller.dart';
import 'package:mbb/controller/controllers.dart';
import 'package:mbb/models/product_lists.dart';

class ProductCart extends StatefulWidget {
  final ProductLists pList;

  const ProductCart({super.key, required this.pList});

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  int? pid;
  int? quantity = 1;
  int? vid;
  String? vPrice;
  String? vOption;
  @override
  void initState() {
    Get.put(CartController());
    if (widget.pList.type == 'variable') {
      setState(() {
        pid = widget.pList.id;
        vid = widget.pList.variations![0].vid;
        vPrice = widget.pList.variations![0].regularPrice;
        vOption = widget.pList.variations![0].option;
        quantity = 1;
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.pList.type == 'variable') {
      return variationCart();
    } else {
      return simpleCart();
    }
  }

  Widget variationCart() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
        width: 60,
        child: DropdownButtonFormField(
            value: widget.pList.variations?[0].option,
            items: widget.pList.variations!.map((value) {
              setState(() {
                vOption = value.option;
              });
              return DropdownMenuItem<String>(
                value: vOption,
                enabled: true,
                child: Text(
                  style: const TextStyle(fontSize: 10),
                  value.option,
                ),
                onTap: () {
                  setState(() {
                    vid = value.vid;
                    vPrice = value.regularPrice;
                  });
                },
              );
            }).toList(),
            onChanged: (val) {
              setState(() {
                pid = widget.pList.id;
                vid = widget.pList.variations![0].vid;
                vPrice = widget.pList.variations![0].regularPrice;
              });
            }),
      ),
      SizedBox(
        width: 40,
        height: 40,
        child: DropdownButton(
            value: quantity,
            items: <int>[1, 2, 3, 4, 5].map((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(value.toString()),
              );
            }).toList(),
            onChanged: (val) {
              setState(() {
                quantity = val as int;
              });
            }),
      ),
      IconButton(
        onPressed: () {
          cartController.addToCart(
            userId: 6,
            id: pid,
            vid: vid,
            quantity: quantity,
          );
        },
        icon: const Icon(Icons.shopping_cart_checkout),
      )
    ]);
  }

  Widget simpleCart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
            width: 40,
            height: 40,
            child: DropdownButton(
                value: quantity,
                items: <int>[1, 2, 3, 4, 5].map((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    quantity = val;
                  });
                })),
        const Padding(padding: EdgeInsets.fromLTRB(0, 0, 5, 0)),
        IconButton(
          onPressed: () {
            pid = widget.pList.id;
            cartController.addToCart(
              userId: 6,
              id: widget.pList.id,
              quantity: 1,
            );
          },
          icon: const Icon(Icons.shopping_cart_checkout),
        )
      ],
    );
  }
}
