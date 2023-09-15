import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbb/controller/controllers.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    // authController.getLoggedInUserInfo();
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/cart.png"),
          fit: BoxFit.contain,
        ),
        gradient: LinearGradient(
          colors: [Colors.cyan, Colors.white],
          begin: FractionalOffset(0.0, 1.0),
          end: FractionalOffset(1.0, 0.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              if (authController.customer.value != null) {
                return Column(
                  children: [
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                      child: Container(
                        // alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  style: const TextStyle(fontSize: 18),
                                  "${authController.customer.value!.firstName} ${authController.customer.value!.lastName}"),
                              Text("${authController.customer.value!.email}")
                            ],
                          ),
                        ),
                      ),
                    ),
                    accountCard(
                      title: "My Details",
                      onClick: () => {},
                      icon: Icons.account_box,
                    ),
                    accountCard(
                      title: "My Orders",
                      onClick: () => {},
                      icon: Icons.list,
                    ),
                    accountCard(
                      title: "Logout",
                      onClick: () => {},
                      icon: Icons.logout,
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    accountCard(
                      title: "Login",
                      onClick: () => {},
                      icon: Icons.login_sharp,
                    ),
                    accountCard(
                      title: "Sign Up",
                      onClick: () => {},
                      icon: Icons.app_registration_rounded,
                    ),
                  ],
                );
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget accountCard(
      {required String title, required Function onClick, IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          onClick();
        },
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 0.1,
              blurRadius: 7,
            ),
          ]),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                Icon(icon)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
