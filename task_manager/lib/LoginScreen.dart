import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/ResetPasswordScreen.dart';
import 'package:task_manager/SignupScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  var email = TextEditingController();
  var password = TextEditingController();

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
        body: WillPopScope(
          child: Padding(
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
                          color: Color(0xFF1DBEF5),
                          fontWeight: FontWeight.w600),
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
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => const Color(0xff1DBEF5))),
                      child: const Text(
                        "Login in",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                ),
              ],
            ),
          ),
          onWillPop: () async {
            SystemNavigator.pop();
            return false;
          },
        ));
  }
}
