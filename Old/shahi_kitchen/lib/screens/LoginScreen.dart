import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shahi_kitchen/screens/DashboardScreen.dart';
import 'package:shahi_kitchen/screens/NewUserInfoScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController verifyCode = TextEditingController();
  late String _verificationId;
  bool codeSend = false;
  String mainText = "Login";
  String detailText = "Enter Phone Number";
  String buttonText = "Send Code";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Image.asset(
            "assets/png/shashi_kitchen.png",
            height: 200,
            width: 200,
          ),
          const Spacer(),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      mainText,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    detailText,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                  codeSend
                      ? Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Colors.black))),
                          child: TextField(
                            controller: verifyCode,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "XXXXXX",
                                hintStyle: TextStyle(color: Colors.black26)),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Colors.black))),
                          child: Row(
                            children: [
                              Text(
                                "+92",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Flexible(
                                child: TextField(
                                  controller: phoneNumber,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "300XXXXXXX",
                                      hintStyle:
                                          TextStyle(color: Colors.black26)),
                                ),
                              ),
                            ],
                          ),
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: codeSend
                        ? TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              if (verifyCode.text.length != 6) {
                                setState(() {
                                  isLoading = false;
                                });
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        elevation: 0,
                                        backgroundColor: Colors.transparent,
                                        content: AwesomeSnackbarContent(
                                          title: "Invalid Code",
                                          message:
                                              "Enter correct code and try again!",
                                          contentType: ContentType.failure,
                                        )));
                              } else {
                                try {
                                  PhoneAuthCredential credential =
                                      PhoneAuthProvider.credential(
                                          verificationId: _verificationId,
                                          smsCode: verifyCode.text);
                                  await firebaseAuth
                                      .signInWithCredential(credential);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NewUserInfoScreen()));
                                } on FirebaseAuthException catch (e) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          elevation: 0,
                                          backgroundColor: Colors.transparent,
                                          content: AwesomeSnackbarContent(
                                            title: "Error",
                                            message: e.message.toString(),
                                            contentType: ContentType.failure,
                                          )));
                                }
                              }
                            },
                            child: isLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ))
                                : Text(
                                    "Verify Code",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                          )
                        : TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              if (phoneNumber.text.length != 10) {
                                setState(() {
                                  isLoading = false;
                                });
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        elevation: 0,
                                        backgroundColor: Colors.transparent,
                                        content: AwesomeSnackbarContent(
                                          title: "Wrong Number",
                                          message:
                                              "Your phone number is incorrect, try again!",
                                          contentType: ContentType.warning,
                                        )));
                              } else {
                                try {
                                  await firebaseAuth.verifyPhoneNumber(
                                      phoneNumber: "+92" + phoneNumber.text,
                                      verificationCompleted:
                                          (PhoneAuthCredential
                                              credential) async {
                                        firebaseAuth
                                            .signInWithCredential(credential);
                                      },
                                      verificationFailed:
                                          (FirebaseAuthException e) {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                elevation: 0,
                                                backgroundColor:
                                                    Colors.transparent,
                                                content: AwesomeSnackbarContent(
                                                  title: "Try Again",
                                                  message: e.message.toString(),
                                                  contentType:
                                                      ContentType.failure,
                                                )));
                                      },
                                      codeSent: (String verificationId,
                                          int? resendToken) async {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                elevation: 0,
                                                backgroundColor:
                                                    Colors.transparent,
                                                content: AwesomeSnackbarContent(
                                                  title: "Code Sent",
                                                  message:
                                                      "Code sent successfully on your number ${phoneNumber.text}.",
                                                  contentType:
                                                      ContentType.success,
                                                )));
                                        setState(() {
                                          isLoading = false;
                                          _verificationId = verificationId;
                                          mainText = "Verify Code";
                                          detailText =
                                              "Enter Verification Code";
                                          codeSend = true;
                                        });
                                      },
                                      codeAutoRetrievalTimeout:
                                          (String verificationId) {});
                                } on FirebaseAuthException catch (e) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          elevation: 0,
                                          backgroundColor: Colors.transparent,
                                          content: AwesomeSnackbarContent(
                                            title: "Error",
                                            message: e.message.toString(),
                                            contentType: ContentType.failure,
                                          )));
                                }
                              }
                            },
                            child: isLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ))
                                : Text(
                                    "Send Code",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                          ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
