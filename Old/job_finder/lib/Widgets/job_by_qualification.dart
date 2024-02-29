import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import '../Models/job_post.dart';
import '../Screens/job_details.dart';
import '../Services/job_post_services.dart';

class JobsByQualification extends StatefulWidget {
  final int? id;
  const JobsByQualification({Key? key, this.id}) : super(key: key);

  @override
  _JobsByQualificationState createState() => _JobsByQualificationState();
}

class _JobsByQualificationState extends State<JobsByQualification> {
  final JobPostService _jobPostService = JobPostService();
  List<JobPost> _jobsListByQualification = [];
  bool isLoading = true;

  _getJobsByQualification() async {
    var jobs = await _jobPostService.jobPostByQualification(widget.id);
    var list = json.decode(jobs.body);
    List<JobPost> results = [];
    list["data"].forEach((data) {
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
      results.add(model);
    });
    setState(() {
      _jobsListByQualification = results;
      isLoading = false;
    });
  }

  @override
  void initState() {
    _getJobsByQualification();
    super.initState();
  }

  Widget? jobsList(){
    if(_jobsListByQualification.isNotEmpty) {
      return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>JobDetails(jobPost: _jobsListByQualification[index],)));
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
                                _jobsListByQualification.isNotEmpty
                                    ? _jobsListByQualification[index].jobTitle!
                                    : '',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(_jobsListByQualification[index].salaryRange!.isNotEmpty ?
                              _jobsListByQualification[index].salaryRange!.toString() : 'N/A',
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
                                  _jobsListByQualification[index].position!,
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
                                  _jobsListByQualification[index].jobType!,
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
      return const Center(child: Text('No Data'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Jobs by Qualification',style: TextStyle(color: Colors.black)),
      ),
      body: !isLoading
          ? jobsList()
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
