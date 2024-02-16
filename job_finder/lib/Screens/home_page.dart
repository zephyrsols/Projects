import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:job_finder/Widgets/nav_drawer.dart';
import 'package:job_finder/Models/job_post.dart';
import 'package:job_finder/Models/qualification.dart';
import 'package:job_finder/Screens/Auth/user_profile.dart';
import 'package:job_finder/Screens/job_search.dart';
import 'package:job_finder/Services/category_services.dart';
import 'package:job_finder/Services/job_post_services.dart';
import 'package:job_finder/Services/qualification_services.dart';
import 'package:job_finder/Widgets/qualification_list_widget.dart';
import 'package:job_finder/Widgets/recent_jobs_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/category.dart';
import '../Widgets/job_types_widget.dart';
import 'Auth/sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Category> _categoryList = [];
  final List<JobPost> _jobPostList = [];
  final List<Qualification> _qualificationList = [];
  final CategoryService _categoryService = CategoryService();
  final JobPostService _jobPostService = JobPostService();
  final QualificationService _qualificationService = QualificationService();
  bool isLoading = true;
  int? id = 1;
  String? name = 'User';

  void _isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');
    String? userName = prefs.getString('userName');
    // String? _userEmail = _prefs.getString('userEmail');
    if (userId != null && userId > 0) {
      setState(() {
        id = userId;
        name = userName!;
        //email = _userEmail;
      });
    }
  }

  void _profilePage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');
    String? userName = prefs.getString('userName');
    String? userEmail = prefs.getString('userEmail');
    if (userId != null && userId > 0 && mounted) {
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


  _getAllCategories() async {
    var categories = await _categoryService.allCategory();
    var result = json.decode(categories.body);
    //print(categories.body);
    result['data'].forEach((data) {
      var model = Category();
      model.id = data["id"];
      model.name = data["name"];
      model.image = data["icon"];
      setState(() {
        _categoryList.add(model);
        isLoading = false;
      });
    });
    //print(result);
  }

  _getAllQualifications() async {
    var qualifications = await _qualificationService.allQualification();
    var result = json.decode(qualifications.body);
    result['data'].forEach((data) {
      var model = Qualification();
      model.id = data["id"];
      model.name = data["name"];
      model.image = data["icon"];
      setState(() {
        _qualificationList.add(model);
        isLoading = false;
      });
    });
    //print(result);
  }

  _getAllJobs() async {
    var allJobs = await _jobPostService.allJobPost();
    var result = json.decode(allJobs.body);
    result['data'].forEach((data) {
      var model = JobPost();
      model.id = data["id"];
      model.companyName = data['companyName'];
      model.salaryRange = data['salaryRange'];
      model.jobTypeId = data['job_type_id'];
      model.jobType = data['jobType'];
      model.jobTitle = data['jobTitle'];
      model.companyLogo = data['companyLogo'];
      model.position = data['position'];
      model.jobDescription = data['jobDescription'];
      model.companyLocation = data['companyLocation'];
      model.created_at = data['created_at'];
      model.categoryId = data['category_id'];
      setState(() {
        _jobPostList.add(model);
        isLoading = false;
      });
    });
    //print(result);
  }


  @override
  void initState() {
    _getAllCategories();
    _getAllQualifications();
    _getAllJobs();
    _isLoggedIn();
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {});
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      //print('A new onMessageOpenedApp event was published!');
    });
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance.subscribeToTopic('all');
    FirebaseMessaging.instance.getToken().then((token) => print(token));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerPage(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const FaIcon(FontAwesomeIcons.barsStaggered),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    showSearch(
                        context: context,
                        delegate: JobSearch(jobPost: _jobPostList));
                  },
                  child: CircleAvatar(
                    child: Image.network(
                      'https://pbs.twimg.com/profile_images/1086871544901656576/f8jZ6ag9_400x400.png',
                      //height: 50,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  name != "User" ? InkWell(
                    onTap:(){
                     _profilePage();
                    },
                    child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659652_1280.png'),
                        backgroundColor: Colors.grey,
                      ),
                  ) : const Text(''),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(children: [
          const Text(
            "Hello",
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.w600, color: Colors.grey),
          ),
           Text(
            name ?? name!,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                'https://img.freepik.com/free-vector/we-are-hiring-promo-landing-page_52683-43453.jpg',
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.23,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Text(
              'Find your job',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
         const JobTypeWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Recent Job List',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  'See all',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
         !isLoading?  RecentJobList(jobPostList: _jobPostList) : const Center(child: CircularProgressIndicator()),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 1),
            child: Text(
              "Jobs by Qualification",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          !isLoading?  AllQualificationsWidget(qualification: _qualificationList,) : const Center(child: CircularProgressIndicator()),
        ]),
      )),
    );
  }
}
