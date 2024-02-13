import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/screens/MainScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewProfileScreen extends StatefulWidget {
  final String email;

  const NewProfileScreen({super.key, required this.email});

  @override
  State<NewProfileScreen> createState() => _NewProfileScreenState();
}

class _NewProfileScreenState extends State<NewProfileScreen> {
  PlatformFile? pickFile;
  UploadTask? uploadTask;
  var fName = TextEditingController();
  var number = TextEditingController();
  var dob = "YYYY-MM-DD";
  var imgLink = "";
  var firestore = FirebaseFirestore.instance;
  var fbStorage = FirebaseStorage.instance;
  bool isLoading = false;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickFile = result.files.first;
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
                  Navigator.pop(context);
                },
                child: SvgPicture.asset("assets/svg/back_img.svg")),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView(
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
                  pickFile == null
                      ? GestureDetector(
                          onTap: () {
                            selectFile();
                          },
                          child: SvgPicture.asset("assets/svg/user_img.svg"))
                      : GestureDetector(
                          onTap: () {
                            selectFile();
                          },
                          child: CircleAvatar(
                            radius: 50,
                            child: ClipOval(
                              child: Image.file(
                                File(pickFile!.path!),
                                fit: BoxFit.cover,
                                width: 100,
                                height: 100,
                              ),
                            ),
                          )),
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
                controller: number,
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
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                  onTap: () async {
                    DateTime? _dobPick = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100));
                    if (_dobPick != null) {
                      setState(() {
                        dob = _dobPick.toString().split(" ")[0];
                      });
                    }
                  },
                  child: Text(
                    dob,
                    style: TextStyle(fontSize: 12),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.black,
                height: 0.3,
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      if (pickFile == null ||
                          fName.text == "" ||
                          number.text == "" ||
                          dob == "YYYY-MM-DD") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Fill all fields!")));
                      } else {
                        final path = "userImgs/${pickFile!.name}";
                        final file = File(pickFile!.path!);

                        var storageRef = fbStorage.ref().child(path);

                        // Update UI to indicate loading state
                        setState(() {
                          isLoading =
                              true; // Assuming you have a variable called isLoading to track loading state
                        });

                        // Upload the file to Firebase Storage
                        UploadTask uploadTask = storageRef.putFile(file);
                        await uploadTask.whenComplete(() async {
                          // When upload completes, get the download URL
                          imgLink = await storageRef.getDownloadURL();
                          print(imgLink);

                          if (imgLink.isNotEmpty) {
                            // Save data to Firestore
                            final data = <String, String>{
                              "email": widget.email,
                              "name": fName.text,
                              "number": number.text,
                              "dob": dob,
                              "imgLink": imgLink
                            };
                            firestore
                                .collection("userData")
                                .add(data)
                                .then((_) {
                              // Navigate to the main screen after data is saved
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainScreen()));
                            }).catchError((error) {
                              // Handle Firestore error
                              print("Error saving data: $error");
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Error saving data")));
                            });
                          } else {
                            // Handle case when download URL is not available
                            print("Download URL is empty");
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Download URL is empty")));
                          }

                          // Update UI to indicate loading state is finished
                          setState(() {
                            isLoading = false;
                          });
                        });
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
                            "Save Info",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
              ),
              const SizedBox(height: 50)
            ],
          ),
        ));
  }
}
