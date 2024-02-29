import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:job_finder/Screens/Auth/sign_up.dart';
import 'package:job_finder/Screens/Auth/user_profile.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Models/user.dart';
import '../../Services/user_services.dart';
import '../home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool isLoading = false;
  final email = TextEditingController();
  final password = TextEditingController();

  _setSharedPrefs() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setInt('userId', 0);
    _prefs.setString('userName', '');
    _prefs.setString('userEmail', '');
  }

   _login(BuildContext context, User user) async {
    var _userService = UserService();
    var registeredUser = await _userService.login(user);
    var result = json.decode(registeredUser.body);

    if (result['result'] == true) {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      _prefs.setInt('userId', result['user']['id']);
      _prefs.setString('userName', result['user']['name']);
      _prefs.setString('userEmail', result['user']['email']);
      String? _userName = _prefs.getString('userName');

      if (user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserProfile(name: _userName),),
        );
      } else {
        Navigator.pop(context);
        _showLoginDialog(context);
      }
    } else if (result['result'] == false) {
      setState(() {
        isLoading = false;
      });
      return {
        // _showFailedDialog(),
        ScaffoldMessenger.of(context).showSnackBar(snackBar),
      };
    }
  }

  _showLoginDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: [
              IconButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomePage()));
              }, icon: const Icon(Icons.home, size: 25,)),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Successfully LoggedIn',
                style: TextStyle(color: Colors.green, fontSize: 25),
              ),
            ],
          ),
        );
      },
    );
  }

  final snackBar = SnackBar(
    content: const Text('Error! Login Failed!. Credential do not match with our database'),
    action: SnackBarAction(
      label: '',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _setSharedPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            LottieBuilder.asset('assets/animation/job_login.json'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          TextFormField(
                            controller: email,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !value.contains('@')) {
                                return 'Please enter valid email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              labelText: 'Enter your email',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: password,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              labelText: 'Enter your password',
                            ),
                            obscureText: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children:  [
                              const Flexible(
                                child: Text(
                                  "Don't have an account. Register a new account.",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w700),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpPage()));
                                },
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w700, color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                          !isLoading
                              ?    Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')),
                                  );
                                  var user = User();
                                  user.email = email.text;
                                  user.password = password.text;
                                  _login(context, user);
                                  setState(() {
                                    isLoading = true;
                                  });

                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black45,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Text('Login',style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold
                              ),),
                            ),
                          ): const CircularProgressIndicator(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
