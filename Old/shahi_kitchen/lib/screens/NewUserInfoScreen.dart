import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shahi_kitchen/screens/DashboardScreen.dart';

class NewUserInfoScreen extends StatefulWidget {
  const NewUserInfoScreen({super.key});

  @override
  State<NewUserInfoScreen> createState() => _NewUserInfoScreenState();
}

class _NewUserInfoScreenState extends State<NewUserInfoScreen> {
  TextEditingController fullName = TextEditingController();
  TextEditingController address = TextEditingController();
  String memberFrom =
      "${DateTime.now().day.toString().padLeft(2, "0")}-${DateTime.now().month.toString().padLeft(2, "0")}-${DateTime.now().year}";
  String orders = "0";
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    userData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
                child: Text(
              "Persanol Info",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            )),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Date",
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      color: Colors.white,
                      child: Text(
                        memberFrom,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text("Full Name"),
            TextField(
              controller: fullName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Container(
                color: Colors.white,
                height: 0.5,
                child: Row(
                  children: [],
                )),
            SizedBox(
              height: 20,
            ),
            Text("Complete Address"),
            TextField(
              controller: address,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Container(
                color: Colors.white,
                height: 0.5,
                child: Row(
                  children: [],
                )),
            SizedBox(
              height: 20,
            ),
            Text("Phone Number"),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 10),
              child: Text(
                "${firebaseAuth.currentUser?.phoneNumber}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
                color: Colors.white,
                height: 0.5,
                child: Row(
                  children: [],
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        final userData = {
                          "name": fullName.text.trim(),
                          "address": address.text.trim(),
                          "phoneNumber":
                              firebaseAuth.currentUser?.phoneNumber.toString(),
                          "orders": orders,
                          "memberFrom": memberFrom
                        };
                        if (fullName.text.isNotEmpty &&
                            address.text.isNotEmpty) {
                          try {
                            await firebaseFirestore
                                .collection("userInfo")
                                .doc(firebaseAuth.currentUser?.phoneNumber
                                    .toString())
                                .set(userData)
                                .onError((error, stackTrace) => print(error));
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DashboardScreen()));
                          } on FirebaseAuthException catch (e) {
                            setState(() {
                              isLoading = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                content: AwesomeSnackbarContent(
                                  title: "Error",
                                  message: e.message.toString(),
                                  contentType: ContentType.failure,
                                )));
                          }
                        } else {
                          setState(() {
                            isLoading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              content: AwesomeSnackbarContent(
                                title: "Empty Fields",
                                message: "Fill all fields first to save info!",
                                contentType: ContentType.warning,
                              )));
                        }
                      },
                      child: isLoading
                          ? CircularProgressIndicator(
                              color: Colors.black,
                            )
                          : Text(
                              "Save Info",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Future userData() async{
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await firebaseFirestore.collection("userInfo").get().then((value) {
      for (var doc in value.docs) {
        if(doc.id == firebaseAuth.currentUser?.phoneNumber){
          setState(() {
            fullName.text = doc.data()["name"];
            address.text = doc.data()["address"];
            memberFrom = doc.data()["memberFrom"];
            orders = doc.data()["orders"];
          });
        }
      }
    });
    return "";
  }
}
