import 'dart:convert';
import 'package:flutter/material.dart';
import '../Models/job_type.dart';
import '../Screens/jobs_by_type.dart';
import '../Services/job_type_services.dart';

class JobTypeWidget extends StatefulWidget {
  const JobTypeWidget({
    Key? key,
  }) : super(key: key);

  @override
  _JobTypeWidgetState createState() => _JobTypeWidgetState();
}

class _JobTypeWidgetState extends State<JobTypeWidget> {
  final List<JobType> _jobTypeList = [];
  final JobTypeService _jobTypeService = JobTypeService();
  bool isLoading = true;

  _getAllJobTypes() async {
    var jobTypes = await _jobTypeService.allJobType();
    var result = json.decode(jobTypes.body);
    result['data'].forEach((data) {
      var model = JobType();
      model.id = data["id"];
      model.name = data["name"];
      setState(() {
        _jobTypeList.add(model);
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    _getAllJobTypes();
    super.initState();
  }

  Widget jobTypes() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(22)),
              height: 200,
              width: MediaQuery.of(context).size.width * .45,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => JobsByType(
                              id:_jobTypeList[0].id
                            )),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.factory,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      '44k',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      _jobTypeList.isNotEmpty ? _jobTypeList[0].name! : '',
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black54),
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              child: SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width * .45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JobsByType(
                                    id:  _jobTypeList[1].id

                                  )),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.purple[100],
                            borderRadius: BorderRadius.circular(22)),
                        height: 90,
                        width: MediaQuery.of(context).size.width * .45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.black,
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  '39k',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Full Time',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black54),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JobsByType(id: _jobTypeList[2].id)),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(22)),
                        height: 90,
                        width: MediaQuery.of(context).size.width * .45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.work,
                                  color: Colors.black,
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  '78k',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Part Time',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black54),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return jobTypes();
  }
}
