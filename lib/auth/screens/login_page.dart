import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_signup_ui_2/core/app_constant.dart';

import '../../commons/mixins.dart';
import 'sign_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> with InputValidationMixin {
  bool _passwordVisible = false;
  final GlobalKey<FormState> loginformKey = GlobalKey<FormState>();
  final emailController =
      TextEditingController(text: 'sthakrishnakumar@gmail.com');
  final passwordController = TextEditingController(text: 'hello bro');
  bool errorEmail = false;
  bool errorPass = false;
  bool isButtonPressed = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 280,
              width: double.infinity,
              child: Image.asset(AppConstant.loginImage),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppConstant.primaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Form(
              key: loginformKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        !errorEmail
                            ? const Padding(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Icon(
                                  Icons.alternate_email_outlined,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              )
                            : const Padding(
                                padding: EdgeInsets.only(bottom: 50),
                                child: Icon(
                                  Icons.alternate_email_outlined,
                                  color: Colors.blue,
                                  size: 20,
                                ),
                              ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                              textInputAction: TextInputAction.next,
                              controller: emailController,
                              // ignore: body_might_complete_normally_nullable
                              validator: (email) {
                                if (isEmailValid(email!)) {
                                  setState(() {
                                    errorEmail = false;
                                  });
                                  return null;
                                } else {
                                  setState(() {
                                    errorEmail = true;
                                  });
                                  return 'Enter valid Email';
                                }
                              },
                              decoration: const InputDecoration(
                                suffixIcon: SizedBox(),
                                errorStyle: TextStyle(fontSize: 10),
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                ),
                                hintText: 'Email ID',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                        textInputAction: TextInputAction.done,
                        validator: (password) {
                          if (isloginPasswordValid(password!)) {
                            setState(() {
                              errorPass = false;
                            });
                            return null;
                          } else {
                            setState(() {
                              errorPass = true;
                            });
                            return 'Enter atleast 8 character';
                          }
                        },
                        controller: passwordController,
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.headphones),
                          errorStyle: const TextStyle(fontSize: 10),
                          hintStyle: const TextStyle(
                            fontSize: 14,
                          ),
                          hintText: 'Password',
                          suffixIcon: !errorPass
                              ? InkWell(
                                  onTap: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                  child: _passwordVisible
                                      ? const Icon(
                                          Icons.visibility_off,
                                          size: 20,
                                        )
                                      : const Icon(
                                          Icons.visibility,
                                          size: 20,
                                        ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(bottom: 28),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                    child: _passwordVisible
                                        ? const Icon(
                                            Icons.visibility_off,
                                            size: 20,
                                          )
                                        : const Icon(
                                            Icons.visibility,
                                            size: 20,
                                          ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   CupertinoPageRoute(
                            //     builder: (context) => const ForgotPassword(),
                            //   ),
                            // );
                          },
                          child: Text(
                            'Forget Password?',
                            style: TextStyle(
                              color: Colors.red.withOpacity(0.9),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    isButtonPressed
                        ? const CircularProgressIndicator()
                        : InkWell(
                            onTap: () {},
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            )),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        Expanded(
                          child: SizedBox(
                            height: 5,
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('OR'),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 5,
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'New to Elearning Sathi?',
                          style: TextStyle(color: Colors.grey),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const SignUpPage(),
                              ),
                            );
                          },
                          child: const Text(
                            '  Register',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
