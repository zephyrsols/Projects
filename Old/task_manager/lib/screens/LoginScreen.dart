import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/screens/MainScreen.dart';
import 'package:task_manager/screens/ResetPasswordScreen.dart';
import 'package:task_manager/screens/SignupScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  var email = TextEditingController();
  var password = TextEditingController();
  var auth = FirebaseAuth.instance;
  var isLoading = false;

  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFDBE9F6),
        appBar: AppBar(
          backgroundColor: const Color(0xFFDBE9F6),
          leading: Padding(
            padding: const EdgeInsets.all(18.0),
            child: GestureDetector(
                onTap: () {
                  SystemNavigator.pop();
                },
                child: SvgPicture.asset("assets/svg/back_img.svg")),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView(
            children: [
              const Text(
                "Welcome Back",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const Text("please enter your email & password to log in"),
              const SizedBox(
                height: 30,
              ),
              const Text("Email"),
              TextField(
                controller: email,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(fontSize: 12),
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "Email",
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text("Password"),
              TextField(
                controller: password,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                style: const TextStyle(fontSize: 12),
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "Password",
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                    child: Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: const Text("Remember me"))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ResetPasswordScreen()));
                  },
                  child: const Text(
                    "Forget password?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF1DBEF5), fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupScreen()));
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                          color: Color(0xFF1DBEF5),
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    height: 1,
                    width: 100,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  const Text(
                    "or connect with",
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Container(
                    height: 1,
                    width: 100,
                    color: Colors.black,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset("assets/svg/google_img.svg"),
                  SvgPicture.asset("assets/svg/apple_img.svg"),
                  SvgPicture.asset("assets/svg/facebook_img.svg"),
                  SvgPicture.asset("assets/svg/twitter_img.svg")
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () async {
                      if (email.text.toString() == "" ||
                          password.text.toString() == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Please fill all fields first.")));
                      } else {
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          await Firebase.initializeApp();
                          UserCredential userCredential =
                              await auth.signInWithEmailAndPassword(
                                  email: email.text, password: password.text);
                          User? user = userCredential.user;
                          if (user!.uid.toString() != "") {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainScreen()));
                          } else {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        } on FirebaseAuthException catch (exception) {
                          setState(() {
                            isLoading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(exception.message.toString()),
                          ));
                        }
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => const Color(0xff1DBEF5))),
                    child: isLoading
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Loading...  ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Container(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3,
                                    color: Colors.white,
                                  ))
                            ],
                          )
                        : Text(
                            "Login in",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
              ),
            ],
          ),
        ));
  }
}
