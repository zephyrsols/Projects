import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/HomeScreen.dart';
import 'package:task_manager/MainScreen.dart';

class NewProfileScreen extends StatefulWidget {
  const NewProfileScreen({super.key});

  @override
  State<NewProfileScreen> createState() => _NewProfileScreenState();
}

class _NewProfileScreenState extends State<NewProfileScreen> {
  var fName = TextEditingController();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter your profile info",
                  style: TextStyle(
                      color: Color(0xFF0B1F51),
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                const Text("please enter your profile info "),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SvgPicture.asset("assets/svg/user_img.svg"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text("Full Name"),
                TextField(
                  controller: fName,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(fontSize: 12),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Full Name",
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text("Phone Number"),
                TextField(
                  controller: fName,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(fontSize: 12),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "923000000000",
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text("Date of Birth"),
                TextField(
                  controller: fName,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(fontSize: 12),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "MM/DD/YYYY",
                  ),

                ),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()));
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => const Color(0xff1DBEF5))),
                      child: const Text(
                        "Save Info",
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
