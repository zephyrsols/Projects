import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job_finder/Screens/date_t_picker.dart';
import 'package:job_finder/Screens/home_page.dart';
import 'package:lottie/lottie.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {

  DateTime? _selectedDate;

  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              CircleAvatar(
                radius: 62,
                backgroundColor: Colors.indigo,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundColor: Colors.green[100],
                    backgroundImage: const NetworkImage(
                        'https://miro.medium.com/max/3150/1*-cdhjSZN7co6suYkulVXNg.png'),
                    radius: 55,
                  ),
                ),
              ),
              Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Name',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                      ),
                      initialValue: 'Pramod Yadav',
                      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Email',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                      ),
                      initialValue: 'pkyadav4488@gmail.com',
                      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Mobile No.',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                      ),
                      initialValue: '9506992540',
                      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'City & State',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                      ),
                      initialValue: 'Varanasi, Uttar Pradesh',
                      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'DOB',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _dateController,
                      decoration: InputDecoration(
                          hintText: '26-jun-2022',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          helpText: 'Select Date of Birth',
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1980),
                          lastDate: DateTime.now(),
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                textTheme: const TextTheme(overline: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600)),
                                colorScheme: ColorScheme.light(
                                  primary: Colors.amber.shade400,
                                  surface: Colors.amber.shade200,
                                  background: Colors.black,
                                  onBackground: Colors.black,
                                  onSecondary: Colors.black,
                                  onSurface: Colors.black,
                                  secondary: Colors.black,
                                  onPrimary: Colors.black,
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );

                        // Check if no date is selected
                        if (pickedDate != null) {
                          setState(() {
                            // using state so that the UI will be rendered when date is picked
                            _dateController.text =
                                DateFormat('dd-MMM-yyyy').format(pickedDate);
                          });
                        }
                        setState(() {
                          // using state so that the UI will be rerendered when date is picked
                          _selectedDate = pickedDate;
                        });
                      },
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      padding: const EdgeInsets.all(8),
                      child: ElevatedButton(
                        onPressed: () {
                          _showAlertDialog(context);
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>const DatePicksByMe()));
                          if (kDebugMode) {
                           _selectedDate != null ? print(DateFormat('dd-MMM-yyyy').format(_selectedDate!)): print('select date');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.indigo.shade400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          'Update',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
                ),
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
                const Text('This is Demo, You can not change anything'),
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
