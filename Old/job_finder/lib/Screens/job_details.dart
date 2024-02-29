import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:job_finder/Models/job_apply.dart';
import 'package:job_finder/Models/job_post.dart';
import 'package:job_finder/Screens/job_apply_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../Helper/db_helper.dart';
import '../Models/favorite.dart';
import 'Auth/sign_in.dart';

class JobDetails extends StatefulWidget {
  final JobPost? jobPost;
  const JobDetails({Key? key, this.jobPost}) : super(key: key);

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  var _isFavorite = false;


  void _isLogged() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    int? userId = _prefs.getInt('userId');
    if (userId != null && userId > 0) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>ApplyForJob(
                categoryId: widget.jobPost!.categoryId,
                jobPost: widget.jobPost,
                userId: userId,
              )));
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    }
  }

  Widget? stackW() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          top: 70,
          width: MediaQuery.of(context).size.width * .9,
          height: 150,
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * .9,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.jobPost!.jobTitle!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget.jobPost!.companyName!,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            fontWeight: FontWeight.w700),
                      ),
                      const Text(
                        '.',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.jobPost!.companyLocation!,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            fontWeight: FontWeight.w700),
                      ),
                      const Text(
                        '.',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.jobPost!.created_at != null
                            ? timeago.format(
                                DateTime.parse(widget.jobPost!.created_at!))
                            : '',
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: MediaQuery.of(context).size.width / 2.5,
          width: 80,
          height: 80,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: CircleAvatar(
              backgroundColor: Colors.green[100],
              radius: 35,
              child: const FaIcon(
                FontAwesomeIcons.apple,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    DBHelper.getSingle(widget.jobPost!.id!).then((value) {
      if (value != null) {
        setState(() {
          _isFavorite = true;
        });
      } else {
        setState(() {
          _isFavorite = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              icon: _isFavorite
                  ? const FaIcon(FontAwesomeIcons.solidBookmark)
                  : const FaIcon(FontAwesomeIcons.bookmark),
              onPressed: () {
                setState(() {
                  Favorite favorite = Favorite();
                  favorite.jobPostId = widget.jobPost!.id;
                  favorite.isFavorite = 1;
                  favorite.jobTitle = widget.jobPost!.jobTitle;
                  favorite.jobDescription = widget.jobPost!.jobDescription;
                  favorite.companyName = widget.jobPost!.companyName;
                  favorite.date = widget.jobPost!.created_at;
                  favorite.companyLogo = widget.jobPost!.companyLogo;
                  favorite.position = widget.jobPost!.position;
                  favorite.documentation = widget.jobPost!.documentation;
                  favorite.salaryRange = widget.jobPost!.salaryRange;
                  favorite.companyLogo = widget.jobPost!.companyLogo;
                  favorite.companyLocation = widget.jobPost!.companyLocation;

                  DBHelper.insert(favorite).then((value) {
                    _isFavorite = !_isFavorite;
                  });
                });
              }),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: 230,
              width: constraints.maxWidth,
              child: stackW()!,
            ),
            SizedBox(
              height: 125,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.amber[200],
                          child: const FaIcon(FontAwesomeIcons.dollarSign)),
                      const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Salary',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        widget.jobPost!.salaryRange!,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.green[200],
                          child: const FaIcon(FontAwesomeIcons.stopwatch)),
                      const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Job Type',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        widget.jobPost!.jobType != null
                            ? widget.jobPost!.jobType!
                            : '',
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.amber[200],
                          child: const Icon(Icons.chair)),
                      const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Position',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        widget.jobPost!.position!,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                children: [
                  TableRow(children: [
                    Text(
                      widget.jobPost!.jobDescription!,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ])
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                children: const [
                  TableRow(
                    children: [
                      Text(
                        'Story App is a multi-purpose app from which you can make multiple types of Apps like Stories/Motivational/News App to provide ease to your audience',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
          maintainBottomViewPadding: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black45,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5.0,
                ),
                onPressed: () {
                  _isLogged();
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Apply Now',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                )),
          )),
    );
  }
}
