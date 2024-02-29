import 'dart:math';
import 'package:flutter/material.dart';
import 'package:job_finder/Screens/job_details.dart';
import '../Models/job_post.dart';

class RecentJobList extends StatefulWidget {
  final List<JobPost>? jobPostList;
  const RecentJobList({Key? key, this.jobPostList}) : super(key: key);

  @override
  State<RecentJobList> createState() => _RecentJobListState();
}

class _RecentJobListState extends State<RecentJobList> {
  Widget? recentJobList() {
    if (widget.jobPostList!.isNotEmpty) {
      return ListView.builder(
        itemCount: widget.jobPostList!.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>JobDetails(jobPost: widget.jobPostList![index],)));
              },
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
                                widget.jobPostList!.isNotEmpty
                                    ? widget.jobPostList![index].jobTitle!
                                    : '',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(widget.jobPostList![index].salaryRange!.isNotEmpty ?
                                widget.jobPostList![index].salaryRange!.toString() : 'N/A',
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
                                  widget.jobPostList![index].position!,
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
                                  widget.jobPostList![index].jobType!,
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
            ),
          );
        },
      );
    } else {
      return const Text('No Data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: widget.jobPostList!.length * 140,
        //height: 600,
        child: recentJobList() != null
            ? recentJobList()!
            :  const SizedBox(
          width: 50,
            child: CircularProgressIndicator()));
  }
}
