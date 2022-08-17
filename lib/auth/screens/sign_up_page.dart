import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../commons/mixins.dart';
import '../../core/app_constant.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget with InputValidationMixin {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with InputValidationMixin {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController fatherNameController = TextEditingController();

  TextEditingController motherNameController = TextEditingController();

  TextEditingController parentContactController = TextEditingController();

  TextEditingController mobileController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController signUPpasswordController = TextEditingController();
  final GlobalKey<FormState> signUPKey = GlobalKey<FormState>();

  bool errorFirstName = false;
  bool errorLastName = false;
  bool errorEmail = false;
  bool errorFatherName = false;
  bool errorMotherName = false;
  bool errorMobile = false;
  bool errorGuardianMobiel = false;
  bool errorClassID = false;
  bool errorClientId = false;
  bool errorPassword = false;
  bool errorPasswordConfimation = false;

  String? selectedGender;
  String? genderError;
  bool loading = false;
  bool isValid = false;

  validateForm() {
    setState(() {
      isValid = signUPKey.currentState!.validate();
    });

    if (selectedGender == null) {
      setState(() {
        genderError = 'Please Select Gender';
      });
      isValid = false;
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    fatherNameController.dispose();
    motherNameController.dispose();
    parentContactController.dispose();
    signUPpasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(
      height: 14,
    );
    const textStyle = TextStyle(
      fontSize: 13,
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 280,
                    width: double.infinity,
                    child: Image.asset(AppConstant.signUpImage),
                  ),
                  Positioned(
                    left: 15,
                    top: 10,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Text(
                  "Sign up",
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
                key: signUPKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      //FirstName TextformField
                      SizedBox(
                        height: 47,
                        child: TextFormField(
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.words,
                          controller: firstNameController,
                          validator: (firstname) {
                            if (isFirstNameValid(firstname!)) {
                              setState(() {
                                errorFirstName = false;
                              });
                              return null;
                            } else {
                              setState(() {
                                errorFirstName = true;
                              });
                              return 'Please enter your first Name';
                            }
                          },
                          decoration: InputDecoration(
                            icon: Padding(
                              padding: errorFirstName
                                  ? const EdgeInsets.only(bottom: 12)
                                  : const EdgeInsets.all(0),
                              child: const Icon(
                                Icons.person,
                                size: 21,
                              ),
                            ),
                            errorStyle: const TextStyle(fontSize: 10),
                            hintStyle: const TextStyle(
                              fontSize: 13,
                            ),
                            hintText: 'First Name',
                          ),
                        ),
                      ),
                      sizedBox,
                      //LastName TextformField
                      SizedBox(
                        height: 47,
                        child: TextFormField(
                          textCapitalization: TextCapitalization.words,
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          controller: lastNameController,
                          validator: (lastname) {
                            if (isLastNameValid(lastname!)) {
                              setState(() {
                                errorLastName = false;
                              });
                              return null;
                            } else {
                              setState(() {
                                errorLastName = true;
                              });
                              return 'Please enter Last Name';
                            }
                          },
                          decoration: InputDecoration(
                            icon: Padding(
                              padding: errorLastName
                                  ? const EdgeInsets.only(bottom: 12)
                                  : const EdgeInsets.all(0),
                              child: const Icon(
                                Icons.person,
                                size: 21,
                              ),
                            ),
                            errorStyle: const TextStyle(fontSize: 10),
                            hintStyle: const TextStyle(
                              fontSize: 13,
                            ),
                            hintText: 'Last Name',
                          ),
                        ),
                      ),
                      sizedBox,

                      Padding(
                        padding: const EdgeInsets.only(left: 36),
                        child: SizedBox(
                          child: DropdownButton(
                            underline: Container(
                              color: Colors.grey,
                              height: 1,
                              width: double.infinity,
                            ),
                            isExpanded: true,
                            hint: genderError == null
                                ? const Text(
                                    'Select Gender',
                                    style: TextStyle(fontSize: 13),
                                  )
                                : const Text(
                                    'Please Select Gender',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                            value: selectedGender,
                            items: AppConstant.gender
                                .map(
                                  (String values) => DropdownMenuItem<String>(
                                    value: values,
                                    child: Text(
                                      values,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (genders) {
                              setState(() {
                                selectedGender = genders.toString();
                                genderError = null;
                              });
                            },
                          ),
                        ),
                      ),
                      sizedBox,
                      //Email TextformField
                      SizedBox(
                        height: 47,
                        child: TextFormField(
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          controller: emailController,
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
                          decoration: InputDecoration(
                            icon: Padding(
                              padding: errorEmail
                                  ? const EdgeInsets.only(bottom: 12)
                                  : const EdgeInsets.all(0),
                              child: const Icon(
                                Icons.alternate_email_outlined,
                                size: 21,
                              ),
                            ),
                            errorStyle: const TextStyle(fontSize: 10),
                            hintStyle: const TextStyle(
                              fontSize: 13,
                            ),
                            hintText: 'Email ID',
                          ),
                        ),
                      ),
                      sizedBox,
                      //Contact TextFormField
                      SizedBox(
                        height: 47,
                        child: TextFormField(
                          maxLength: 10,
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          controller: mobileController,
                          validator: (mobile) {
                            if (isPhoneValid(mobile!)) {
                              setState(() {
                                errorMobile = false;
                              });
                              return null;
                            } else {
                              setState(() {
                                errorMobile = true;
                              });
                              return 'Enter valid number';
                            }
                          },
                          decoration: InputDecoration(
                            counterText: '',
                            icon: Padding(
                              padding: errorMobile
                                  ? const EdgeInsets.only(bottom: 12)
                                  : const EdgeInsets.all(0),
                              child: const Icon(
                                Icons.phone,
                                size: 21,
                              ),
                            ),
                            errorStyle: const TextStyle(fontSize: 10),
                            hintStyle: const TextStyle(
                              fontSize: 13,
                            ),
                            hintText: 'Contact number',
                          ),
                        ),
                      ),
                      sizedBox,
                      //FatherName TextformField
                      SizedBox(
                        height: 47,
                        child: TextFormField(
                          textCapitalization: TextCapitalization.words,
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          controller: fatherNameController,
                          validator: (fathername) {
                            if (isLastNameValid(fathername!)) {
                              setState(() {
                                errorFatherName = false;
                              });
                              return null;
                            } else {
                              setState(() {
                                errorFatherName = true;
                              });
                              return 'Please enter Mother Name';
                            }
                          },
                          decoration: InputDecoration(
                            icon: Padding(
                              padding: errorFatherName
                                  ? const EdgeInsets.only(bottom: 12)
                                  : const EdgeInsets.all(0),
                              child: const Icon(
                                Icons.person,
                                size: 21,
                              ),
                            ),
                            errorStyle: const TextStyle(fontSize: 10),
                            hintStyle: const TextStyle(
                              fontSize: 13,
                            ),
                            hintText: 'Father Name',
                          ),
                        ),
                      ),
                      sizedBox,
                      //MotherName TextformField
                      SizedBox(
                        height: 47,
                        child: TextFormField(
                          textCapitalization: TextCapitalization.words,
                          style: textStyle,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          controller: motherNameController,
                          validator: (mothername) {
                            if (isLastNameValid(mothername!)) {
                              setState(() {
                                errorMotherName = false;
                              });
                              return null;
                            } else {
                              setState(() {
                                errorMotherName = true;
                              });
                              return 'Please enter Mother Name';
                            }
                          },
                          decoration: InputDecoration(
                            icon: Padding(
                              padding: errorMotherName
                                  ? const EdgeInsets.only(bottom: 12)
                                  : const EdgeInsets.all(0),
                              child: const Icon(
                                Icons.person,
                                size: 21,
                              ),
                            ),
                            errorStyle: const TextStyle(fontSize: 10),
                            hintStyle: const TextStyle(
                              fontSize: 13,
                            ),
                            hintText: 'Mother Name',
                          ),
                        ),
                      ),
                      sizedBox,
                      //Guardian Mobile TextformField
                      SizedBox(
                        height: 47,
                        child: TextFormField(
                          maxLength: 10,
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          controller: parentContactController,
                          validator: (parentcontact) {
                            if (isParentPhoneValid(parentcontact!)) {
                              setState(() {
                                errorMotherName = false;
                              });
                              return null;
                            } else {
                              setState(() {
                                errorGuardianMobiel = true;
                              });
                              return 'Please enter valid number';
                            }
                          },
                          decoration: InputDecoration(
                            counterText: "",
                            icon: Padding(
                              padding: errorGuardianMobiel
                                  ? const EdgeInsets.only(bottom: 12)
                                  : const EdgeInsets.all(0),
                              child: const Icon(
                                Icons.phone,
                                size: 21,
                              ),
                            ),
                            errorStyle: const TextStyle(fontSize: 10),
                            hintStyle: const TextStyle(
                              fontSize: 13,
                            ),
                            hintText: 'Parent contact number ',
                          ),
                        ),
                      ),
                      sizedBox,
                      //Password TextformField
                      SizedBox(
                        height: 47,
                        child: TextFormField(
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          controller: signUPpasswordController,
                          validator: (password) {
                            if (isPasswordValid(password!)) {
                              setState(() {
                                errorPassword = false;
                              });
                              return null;
                            } else {
                              setState(() {
                                errorPassword = true;
                              });
                              return 'Atleast 8 character required';
                            }
                          },
                          decoration: InputDecoration(
                            counterText: "",
                            icon: Padding(
                              padding: errorPassword
                                  ? const EdgeInsets.only(bottom: 12)
                                  : const EdgeInsets.all(0),
                              child: const Icon(
                                Icons.key_outlined,
                                size: 21,
                              ),
                            ),
                            errorStyle: const TextStyle(fontSize: 10),
                            hintStyle: const TextStyle(
                              fontSize: 13,
                            ),
                            hintText: 'Please Password ',
                          ),
                        ),
                      ),
                      sizedBox,
                      //Password TextformField
                      SizedBox(
                        height: 47,
                        child: TextFormField(
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          controller: confirmPasswordController,
                          validator: (confirmpassword) {
                            if (signUPpasswordController.text ==
                                confirmPasswordController.text) {
                              setState(() {
                                errorPasswordConfimation = false;
                              });
                              return null;
                            } else {
                              setState(() {
                                errorPasswordConfimation = true;
                              });
                              return 'Passwords do not match';
                            }
                          },
                          decoration: InputDecoration(
                            counterText: "",
                            icon: Padding(
                              padding: errorGuardianMobiel
                                  ? const EdgeInsets.only(bottom: 12)
                                  : const EdgeInsets.all(0),
                              child: const Icon(
                                Icons.key_outlined,
                                size: 21,
                              ),
                            ),
                            errorStyle: const TextStyle(fontSize: 10),
                            hintStyle: const TextStyle(
                              fontSize: 13,
                            ),
                            hintText: 'Confirm Password ',
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'By Signing up, you\'re agree to our ',
                                style: TextStyle(
                                  letterSpacing: 0.1,
                                  color: Colors.grey,
                                  fontSize: 11,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: const Text(
                                  'Terms & Conditions',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.1,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                ' and ',
                                style: TextStyle(
                                  letterSpacing: 0.1,
                                  color: Colors.grey,
                                  fontSize: 11,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: const Text(
                                  'Privacy Policy',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.1,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      loading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : InkWell(
                              onTap: () async {
                                validateForm();
                              },
                              child: Container(
                                height: 47,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Joined Us Before?',
                    style: TextStyle(color: Colors.grey),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text(
                      '  Login',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
