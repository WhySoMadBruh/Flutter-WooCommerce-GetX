import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:get/get.dart';
import 'package:mbb/components/input_text_button.dart';
import 'package:mbb/components/input_text_field.dart';
import 'package:mbb/controller/auth_controller.dart';
import 'package:mbb/controller/controllers.dart';
import 'package:mbb/extention/string_extention.dart';
import 'package:mbb/views/account/auth/signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    Get.put(AuthController());
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/cart.png"),
                fit: BoxFit.cover,
              ),
              gradient: LinearGradient(
                colors: [Colors.cyan, Colors.white],
                begin: FractionalOffset(0.0, 1.0),
                end: FractionalOffset(1.0, 0.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        height: 400,
                        child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Image(
                                  image: AssetImage("assets/MBB.png"),
                                  width: 100,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: InputTextField(
                                    title: "Email",
                                    textInputType: TextInputType.emailAddress,
                                    textEditingController: emailController,
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
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: InputTextField(
                                    title: "Password",
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    obsecureText: true,
                                    textEditingController: passwordController,
                                    validation: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return "Password is required";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: InputTextButton(
                                      title: "Login",
                                      onClick: () {
                                        if (_formKey.currentState!.validate()) {
                                          authController.authenticateUser(
                                              email: emailController.text,
                                              password:
                                                  passwordController.text);
                                        }
                                      }),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: const Text("Forget password"),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(const SignUpScreen());
                                        },
                                        child: const Text("Sign up instead"),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
