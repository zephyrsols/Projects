import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Screens/Auth/sign_in.dart';
import '../Screens/Auth/user_profile.dart';
import '../Screens/favorite_list.dart';


void _profilePage(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int? userId = prefs.getInt('userId');
  String? userName = prefs.getString('userName');
  String? userEmail = prefs.getString('userEmail');
  if (userId != null && userId > 0) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserProfile(
          id: userId,
          name: userName,
          email: userEmail,
        ),
      ),
    );
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }
}

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {

  void _isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');
    String? userName = prefs.getString('userName');
    // String? _userEmail = _prefs.getString('userEmail');
    setState(() {
      _userId = userId;
    });
  }
  @override
  void initState() {
    _isLoggedIn();
    super.initState();
  }

  SharedPreferences? _prefs;
  int? _userId;
  final IconData _loginLogoutIcon = Icons.login;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            Image.asset('assets/animation/logo.png',fit: BoxFit.fill,height: 250,),
           _userId! > 0 ? InkWell(
              onTap: () => _profilePage(context),
              child: const ListTile(
                leading: Icon(
                  Icons.person,
                  size: 20,
                  color: Colors.black,
                ),
                title: Text(
                  'My Profile',
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ) : const SizedBox(),

            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: const ListTile(
                leading: Icon(
                  Icons.home,
                  size: 20,
                  color: Colors.black,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavoriteList()));
                //
              },
              child: const ListTile(
                leading: Icon(Icons.favorite, size: 25, color: Colors.black),
                title: Text(
                  'Bookmarked',
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ),

           _userId! > 0 ? InkWell(
              onTap: () async {
                Navigator.pop(context);
                _prefs = await SharedPreferences.getInstance();
                _prefs?.setInt('userId', 0);
                _prefs?.setString('userName', '');
                _prefs?.setString('userEmail', '');
                if(mounted){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const LoginPage()));
                }
                setState(() {});
              },
              child: ListTile(
                  title: const Text(
                    'LogOut',
                    style: TextStyle(fontSize: 20),
                  ),
                  leading: Icon(
                    _loginLogoutIcon,
                    size: 20,
                    color: Colors.black,
                  )),
            ) :  ListTile(
             onTap: (){
               Navigator.pop(context);
               Navigator.push(
                   context, MaterialPageRoute(builder: (context) => const LoginPage()));
             },
             leading: const Icon(Icons.login, size: 25, color: Colors.black),
             title: const Text(
               'Login',
               style: TextStyle(fontSize: 20),
             ),
             trailing: const Icon(
               Icons.arrow_forward,
               size: 20,
               color: Colors.black,
             ),
           ),
            const SizedBox(
              height: 50,
            ),
          ],
        ));
  }
}
