import 'dart:io';

import 'package:cubesharp_assignment_app/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  PhoneNumber number = PhoneNumber(isoCode: "IND", dialCode: "+91");

  final TextEditingController _passController = TextEditingController();
  final _keyforSubmit = GlobalKey<FormState>();
  int count = 0;
  bool isobscuretext = true;
  void _submit() {
    final isValid = _keyforSubmit.currentState!.validate();
    if (!isValid) {
      return;
    }
    _keyforSubmit.currentState!.save();
  }

  void _checkPass() {
    if (_passController.text == 'test@78563' &&
        number.phoneNumber == '+911234567890') {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (context) => const HomeScreen()));
    } else {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid Password'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: deviceSize.height,
          width: deviceSize.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffe65400), Color(0xfff88912)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 200,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Welcome Back",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.9)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: deviceSize.height * 0.1),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60))),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.orange.withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Enter Phone Number',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Form(
                                key: _keyforSubmit,
                                child: InternationalPhoneNumberInput(
                                  initialValue: PhoneNumber(
                                    isoCode:
                                        Platform.localeName.split('_').last,
                                  ),
                                  onSaved: (value) {
                                    number = value;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter a valid number';
                                    }
                                    if (value.length < 10) {
                                      return 'Please enter a valid number';
                                    }

                                    return null;
                                  },
                                  onInputChanged: (value) {
                                    setState(() {
                                      count = value.toString().length - 57;
                                      number = value;
                                    });
                                  },
                                  ignoreBlank: false,
                                  autoValidateMode: AutovalidateMode.disabled,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          signed: true, decimal: true),
                                  inputBorder: InputBorder.none,
                                  formatInput: true,
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: count <= 10
                                    ? Text(
                                        '$count/10',
                                      )
                                    : const Text(
                                        'Invalid Number',
                                        style: TextStyle(color: Colors.red),
                                      ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _submit();
                            showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (_) => Padding(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom),
                                      child: StatefulBuilder(builder:
                                          (BuildContext context,
                                              StateSetter setModalState) {
                                        return SizedBox(
                                          width: double.infinity,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.all(9),
                                                height: 5,
                                                width: 90,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey
                                                        .withOpacity(0.33),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                margin:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: TextField(
                                                        controller:
                                                            _passController,
                                                        obscureText:
                                                            isobscuretext,
                                                        decoration:
                                                            const InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                hintText:
                                                                    'Password'),
                                                      ),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          setModalState(() {
                                                            isobscuretext =
                                                                !isobscuretext;
                                                          });
                                                        },
                                                        icon: Icon(
                                                          !isobscuretext
                                                              ? Icons
                                                                  .visibility_off
                                                              : Icons
                                                                  .visibility,
                                                          color: Colors.grey,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: TextButton(
                                                    onPressed: () {},
                                                    child: const Text(
                                                      'Forgot Password?',
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    )),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  _checkPass();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  backgroundColor:
                                                      const Color(0xffff4c3b),
                                                ),
                                                child: const Text(
                                                  'Verify Password',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    ));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffff4c3b),
                              minimumSize: const Size(200, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          child: const Text(
                            'Proceed',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
