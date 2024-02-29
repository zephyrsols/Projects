import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:job_finder/Screens/Auth/sign_in.dart';
import 'package:job_finder/Screens/home_page.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/user.dart';
import '../../Services/user_services.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
  GlobalKey<ScaffoldMessengerState>();
  final name = TextEditingController();

  final email = TextEditingController();

  final password = TextEditingController();

  _register(BuildContext context, User user) async {
    var _userService = UserService();
    var registeredUser = await _userService.createUser(user);
    var result = json.decode(registeredUser.body);
    print(result);
    if (result['result'] == true) {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      _prefs.setInt('userId', result['user']['id']);
      _prefs.setString('userName', result['user']['name']);
      _prefs.setString('userEmail', result['user']['email']);
      Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage()));
      // if (this.widget.id != null) {
      //   Navigator.pop(context);
      //   // Navigator.push(
      //   //     context,
      //   //     MaterialPageRoute(
      //   //         builder: (context) => PostComment(id: this.widget.id,)));
      // } else {
      //   Navigator.pop(context);
      //   _showLoginDialog(context);
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => HomePage()));
      // }
    } else {
      // _showSnackMessage(Text(
      //   'Failed to register the user!',
      //   style: TextStyle(color: Colors.red),
      // )
      // );
      setState(() {
        isLoading = false;
      });
      return {
        ScaffoldMessenger.of(context).showSnackBar(snackBar),
      };
      // _showDialog();
    }
  }

  final snackBar = SnackBar(
    content: const Text(
        'Error! Registration Failed. Please register with different email address'),
    action: SnackBarAction(
      label: '.',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            LottieBuilder.asset('assets/animation/job_login.json'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: name,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter  name';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              labelText: 'Enter your name',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: email,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !value.contains('@')) {
                                return 'Please enter valid email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              labelText: 'Enter your email',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: password,
                            validator: (value) {
                              if (value == null || value.length < 8 ||
                                  value.isEmpty) {
                                return 'Please enter min 8 digit Password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              labelText: 'Create your password',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Flexible(
                                child: Text(
                                  "Already have an account. Click to Login",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w700),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w700, color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        !isLoading ?  Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')),
                                  );
                                  var user = User();
                                  user.name = name.text;
                                  user.email = email.text;
                                  user.password = password.text;
                                  _register(context, user);
                                  setState(() {
                                    isLoading = true;
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black45,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Text('SignUp',style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold
                              ),),
                            ),
                          ) : const CircularProgressIndicator(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
