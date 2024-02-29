import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shahi_kitchen/screens/LoginScreen.dart';
import 'package:shahi_kitchen/screens/NewUserInfoScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String name = "";
  String address = "";
  String phoneNumber = "";
  String memberFrom = "";
  String orders = "";


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
        padding: const EdgeInsets.fromLTRB(28, 28, 28, 78),
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
              children: [
                Spacer(),
                Column(
                  children: [
                    Text("Total Orders"),
                    Container(
                      padding: EdgeInsets.all(5),
                      color: Colors.white,
                      child: Text(
                        orders,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      "Member From",
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
                Spacer(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text("Name"),
            Text(
              name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
            Text("Address"),
            Text(
              address,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
            Text(
              phoneNumber,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
              children: [
                Container(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>NewUserInfoScreen()));
                      },
                      child: Text(
                        "Edit Info",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      )),
                ),
                Spacer(),
                Container(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () async {
                        await firebaseAuth.signOut();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        "Logout",
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
           name = doc.data()["name"];
           address = doc.data()["address"];
           phoneNumber = doc.data()["phoneNumber"];
           memberFrom = doc.data()["memberFrom"];
           orders = doc.data()["orders"];
         });
       }
      }
    });
    return "";
  }
}
