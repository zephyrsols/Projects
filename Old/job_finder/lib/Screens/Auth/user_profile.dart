import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:job_finder/Screens/Auth/profile_edit.dart';
import 'package:lottie/lottie.dart';

import '../home_page.dart';

class UserProfile extends StatefulWidget {
  final String? name;
  final int? id;
  final String? email;
  const UserProfile({Key? key, this.name, this.email, this.id})
      : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TabController? controller;

  Widget? stackW() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          top: 60,
          width: MediaQuery.of(context).size.width * .9,
          height: MediaQuery.of(context).size.height * .9,
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * .9,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    widget.name != null ? widget.name! : 'Guest',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                 // Text(widget.id != null  ? widget.id.toString() : ''),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Mobile App Developer",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.black45,
                                spreadRadius: 5)
                          ],
                        ),
                        child: CircleAvatar(
                            backgroundColor: Colors.pink.shade400,
                            child: IconButton(
                              autofocus: true,
                              onPressed: () {},
                              icon: const FaIcon(
                                FontAwesomeIcons.dribbble,
                                color: Colors.white,
                              ),
                              splashColor: Colors.amber,
                              visualDensity: VisualDensity.standard,
                              splashRadius: 55,
                            )),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.black45,
                                spreadRadius: 5)
                          ],
                        ),
                        child: CircleAvatar(
                            backgroundColor: Colors.red.shade300,
                            child: IconButton(
                                onPressed: () {},
                                icon: const FaIcon(
                                  FontAwesomeIcons.stackOverflow,
                                  color: Colors.white,
                                ))),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.black45,
                                spreadRadius: 5)
                          ],
                        ),
                        child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: IconButton(
                                onPressed: () {},
                                icon: const FaIcon(
                                  FontAwesomeIcons.behance,
                                  color: Colors.white,
                                ))),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.black45,
                                spreadRadius: 5)
                          ],
                        ),
                        child: CircleAvatar(
                            backgroundColor: Colors.blue.shade600,
                            child: IconButton(
                                onPressed: () {},
                                icon: const FaIcon(
                                  FontAwesomeIcons.linkedinIn,
                                  color: Colors.white,
                                ))),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'About Me',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'I am a Computer science engineer and I love and enjoy creating Android apps, Editing of Videos and Photos. I am a Professional WordPress developer. I create Intro Video for Youtube as well as for all occasion.',
                      style: TextStyle(fontSize: 17),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: MediaQuery.of(context).size.width / 2.5,
          width: 100,
          height: 100,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: CircleAvatar(
                  backgroundColor: Colors.green[100],
                  radius: 55,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                        'https://miro.medium.com/max/3150/1*-cdhjSZN7co6suYkulVXNg.png'),
                  )),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileEdit()));
              },
              icon: const Icon(Icons.edit))
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(height: 500, child: stackW()!),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    onTap: (){
                      _showAlertDialog(context);
                    },
                    leading: const CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 20,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: FaIcon(
                            FontAwesomeIcons.briefcase,
                            color: Colors.white,
                          ),
                        )),
                    title: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Experience',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    isThreeLine: true,
                    subtitle: const Text('!0+ Years'),
                  ),
                  ListTile(
                    onTap: (){
                      _showAlertDialog(context);
                    },
                    leading: const CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 20,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: FaIcon(
                            FontAwesomeIcons.listCheck,
                            color: Colors.white,
                          ),
                        )),
                    title: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Applied Jobs',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    isThreeLine: true,
                    subtitle: const Text('Click to view'),
                  ),
                  ListTile(
                    onTap: (){
                      _showAlertDialog(context);
                    },
                    leading: const CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 20,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: FaIcon(
                            FontAwesomeIcons.wrench,
                            color: Colors.white,
                          ),
                        )),
                    title: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Settings',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    isThreeLine: true,
                    subtitle: const Text('Click to change'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) =>
          CupertinoAlertDialog(
            title: const Text('Demo Account'),
            content: Column(
              children:  [
                Lottie.asset('assets/animation/close.json',width: 200),
                const Text('This is Demo, You can not see everything in demo'),
              ],
            ),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
                },
                child: const Text('Home Menu'),
              ),
            ],
          ),
    );
  }
}
