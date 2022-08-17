import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_ui_2/auth/widgets/my_form_field.dart';

import '../../commons/mixins.dart';
import '../../core/app_constant.dart';
import 'sign_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> with InputValidationMixin {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> loginformKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  bool errorEmail = false;
  bool errorPass = false;
  bool isButtonPressed = false;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
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
    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(
    //     statusBarColor: Colors.white,
    //     statusBarBrightness: Brightness.light,
    //     statusBarIconBrightness: Brightness.dark,
    //   ),
    // );

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
              height: 30,
            ),
            Form(
              key: loginformKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: MyFormField(
                        isError: errorEmail,
                        icon: Icons.alternate_email,
                        controller: emailController,
                        validator: (email) => emailValidate(email),
                        hintText: 'Email',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      child: MyFormField(
                        isError: errorPass,
                        controller: passwordController,
                        obscureText: !_passwordVisible,
                        validator: (password) => passwordValidate(password),
                        hintText: 'Password',
                        icon: Icons.lock,
                        suffixIcon: suffixIconWidget(),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {},
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
                            onTap: () {
                              loginformKey.currentState!.validate();
                            },
                            child: containerWidget(),
                          ),
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
                          child: const Padding(
                            padding: EdgeInsets.only(left: 3),
                            child: Text(
                              'Register',
                              style: TextStyle(color: Colors.blue),
                            ),
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

  String? passwordValidate(password) {
    if (isPasswordValid(password!)) {
      setState(() {
        errorPass = false;
      });
      return null;
    } else {
      setState(() {
        errorPass = true;
      });
      return 'Enter Valid Password';
    }
  }

  String? emailValidate(email) {
    if (isEmailValid(email!)) {
      setState(() {
        errorEmail = false;
      });
      return null;
    } else {
      setState(() {
        errorEmail = true;
      });
      return 'Enter Valid Email';
    }
  }

  Container containerWidget() => Container(
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
      );

  Padding suffixIconWidget() => Padding(
        padding: EdgeInsets.only(bottom: errorPass ? 28 : 0),
        child: InkWell(
          onTap: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
          child: Icon(
            _passwordVisible ? Icons.visibility_off : Icons.visibility,
            size: 20,
          ),
        ),
      );
}
