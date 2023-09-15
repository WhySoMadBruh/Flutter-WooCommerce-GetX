import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mbb/extention/string_extention.dart';

import '../../../components/input_text_field.dart';
import '../../../controller/controllers.dart';
import '../../cart/cart_components/cart_card.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final _formKey = GlobalKey<FormState>();

  int cartTotal() {
    var total = 0;
    for (var i = 0; i < cartController.cart.value!.products!.length; i++) {
      total += cartController.cart.value!.products![i].lineTotal as int;
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: InputTextField(
                    title: "First Name",
                    textInputType: TextInputType.emailAddress,
                    // textEditingController: emailController,
                    validation: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required.";
                      } else if (!value.isValidEmail) {
                        return "Please enter valid email";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: InputTextField(
                    title: "Last Name",
                    textInputType: TextInputType.emailAddress,
                    // textEditingController: emailController,
                    validation: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required.";
                      } else if (!value.isValidEmail) {
                        return "Please enter valid email";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: InputTextField(
                    title: "Email",
                    textInputType: TextInputType.emailAddress,
                    // textEditingController: emailController,
                    validation: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required.";
                      } else if (!value.isValidEmail) {
                        return "Please enter valid email";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: InputTextField(
                    title: "Phone number",
                    textInputType: TextInputType.emailAddress,
                    // textEditingController: emailController,
                    validation: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required.";
                      } else if (!value.isValidEmail) {
                        return "Please enter valid email";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            InputTextField(
              title: "Address Line 1",
              textInputType: TextInputType.emailAddress,
              // textEditingController: emailController,
              validation: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Email is required.";
                } else if (!value.isValidEmail) {
                  return "Please enter valid email";
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            InputTextField(
              title: "Address Line 2",
              textInputType: TextInputType.emailAddress,
              // textEditingController: emailController,
              validation: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Email is required.";
                } else if (!value.isValidEmail) {
                  return "Please enter valid email";
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            InputTextField(
              title: "Additional note",
              textInputType: TextInputType.emailAddress,
              // textEditingController: emailController,
              validation: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Email is required.";
                } else if (!value.isValidEmail) {
                  return "Please enter valid email";
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemCount: cartController.cart.value!.products!.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(cartController
                        .cart.value!.products![index].cartItemKey),
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
                      cartItemKey: cartController
                          .cart.value!.products![index].cartItemKey,
                      productId:
                          cartController.cart.value!.products![index].productId,
                      productName: cartController
                          .cart.value!.products![index].productName,
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        onTap: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Place Order",
                                style: TextStyle(color: Colors.white)),
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
        ),
      ),
    );
  }
}
