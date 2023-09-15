import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbb/controller/controllers.dart';
import 'package:mbb/models/cart.dart';
import 'package:mbb/views/cart/cart_components/cart_card.dart';
import 'package:mbb/views/checkout/check_components/checkout_form.dart';
import 'package:mbb/views/checkout/checkout_screen.dart';

class CartList extends StatefulWidget {
  Cart cart = Cart(userId: authController.customer.value!.id!);
  CartList({super.key, required this.cart});

  @override
  State<CartList> createState() => _CartListState();
}

int cartTotal() {
  var total = 0;
  for (var i = 0; i < cartController.cart.value!.products!.length; i++) {
    total += cartController.cart.value!.products![i].lineTotal as int;
  }

  return total;
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height - 150,
          child: Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemCount: cartController.cart.value!.products!.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(
                      cartController.cart.value!.products![index].cartItemKey),
                  background: Container(
                    alignment: Alignment.centerLeft,
                    color: Colors.red,
                    child: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(Icons.delete)),
                  ),
                  onDismissed: (direction) {
                    cartController.deleteCartItem(
                      userId: cartController.cart.value!.userId,
                      cartItemKey: cartController
                          .cart.value!.products![index].cartItemKey,
                    );
                  },
                  child: CartCard(
                    userId: cartController.cart.value!.userId,
                    cartItemKey:
                        cartController.cart.value!.products![index].cartItemKey,
                    productId:
                        cartController.cart.value!.products![index].productId,
                    productName:
                        cartController.cart.value!.products![index].productName,
                    quantity:
                        cartController.cart.value!.products![index].quantity,
                    productRegularPrice: cartController
                        .cart.value!.products![index].productRegularPrice,
                    productSalePrice: cartController
                        .cart.value!.products![index].productSalePrice,
                    thumbnail:
                        cartController.cart.value!.products![index].thumbnail,
                    lineSubtotal: cartController
                        .cart.value!.products![index].lineSubtotal,
                    lineTotal:
                        cartController.cart.value!.products![index].lineTotal,
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total: ₹${cartTotal()}",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
              SizedBox(
                width: 120,
                height: 40,
                child: Container(
                  color: Colors.black,
                  child: InkWell(
                    focusColor: Colors.red,
                    splashColor: Colors.red,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    onTap: () {
                      Get.to(CheckOut());
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Checkout", style: TextStyle(color: Colors.white)),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.exit_to_app, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
