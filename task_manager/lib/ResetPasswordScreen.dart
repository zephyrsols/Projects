import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  var email = TextEditingController();

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
                  Navigator.pop(context);
                },
                child: SvgPicture.asset("assets/svg/back_img.svg")),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Reset your password",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const Text(
                    "please enter your email and we will send an otp code in the next step to reset your password."),
                const SizedBox(
                  height: 50,
                ),
                const Text("Email"),
                TextField(
                  controller: email,
                  textInputAction: TextInputAction.done,
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
                const Spacer(),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => const Color(0xff1DBEF5))),
                      child: const Text(
                        "Send reset link",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                ),
                const SizedBox(height: 50)
              ],
            ),
          ),
        ));
  }
}
