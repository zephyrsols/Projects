import 'dart:math';

import 'package:flutter/material.dart';
import 'package:job_finder/Models/job_post.dart';
import 'package:job_finder/Screens/job_details.dart';
import 'package:lottie/lottie.dart';

import '../Models/favorite.dart';

class AllFavoriteHome extends StatefulWidget {
  final List<Favorite>? favoriteList;
  AllFavoriteHome({required this.favoriteList});
  @override
  _AllFavoriteHomeState createState() => _AllFavoriteHomeState();
}

class _AllFavoriteHomeState extends State<AllFavoriteHome> {
  @override
  void initState() {
    print(widget.favoriteList!.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.favoriteList!.length > 0
        ? Container(
      child: ListView.builder(
        // scrollDirection: Axis.horizontal,
        itemCount: widget.favoriteList!.length,
        itemBuilder: (context, index) {
          JobPost jobPost = JobPost();
          jobPost.id = widget.favoriteList![index].jobPostId;
          jobPost.jobTitle = widget.favoriteList![index].jobTitle;
          jobPost.jobDescription = widget.favoriteList![index].jobDescription!;
          jobPost.companyName = widget.favoriteList![index].companyName;
          jobPost.created_at = widget.favoriteList![index].date;
          jobPost.companyLogo = widget.favoriteList![index].companyLogo;
          jobPost.companyLocation = widget.favoriteList![index].companyLocation;
          jobPost.salaryRange = widget.favoriteList![index].salaryRange;
          jobPost.position = widget.favoriteList![index].position;
          jobPost.jobType = widget.favoriteList![index].jobType;
         // myStory.views = '**';
          jobPost.companyLocation = widget.favoriteList![index].companyLocation;
          jobPost.categoryId = 0;
          return AllFavorite(jobPost: jobPost);
        },
      ),
    )
        : Image.asset('assets/no-food.png');
  }
}

class AllFavorite extends StatefulWidget {
  final JobPost? jobPost;
   AllFavorite({this.jobPost});
  @override
  _AllFavoriteState createState() => _AllFavoriteState();
}

class _AllFavoriteState extends State<AllFavorite> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 300,
      width: MediaQuery.of(context).size.width,
      child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => JobDetails(
                      jobPost: widget.jobPost,
                    )));
          },
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors
                          .primaries[Random().nextInt(Colors.primaries.length)]
                          .shade100,
                      borderRadius: BorderRadius.circular(15)),
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                                backgroundColor: Colors.purple[300],
                                child: const Icon(Icons.apple)),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.jobPost!.jobTitle!,
                                  style: const TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                Text(widget.jobPost!.salaryRange!.isNotEmpty ?
                                widget.jobPost!.salaryRange!.toString() : 'N/A',
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            )
                          ],
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 5),
                                  child: Text(
                                    widget.jobPost!.position!,
                                    style: const TextStyle(
                                        fontSize: 12, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 5),
                                  child: Text(
                                    widget.jobPost!.jobType!=null ? widget.jobPost!.jobType! : 'N/A',
                                    style: const TextStyle(
                                        fontSize: 12, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Flexible(
                                child: Card(
                                  color: Colors.amber[300],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 5),
                                    child: Text(
                                      'Apply',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
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
              )
            ),
          )),
    );
  }
}
