import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/Models/qualification.dart';
import 'package:job_finder/Screens/home_page.dart';
import 'package:job_finder/Services/qualification_services.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import '../Helper/constants.dart';
import '../Models/job_post.dart';

class ApplyForJob extends StatefulWidget {
  final int? userId;
  final int? categoryId;
  final JobPost? jobPost;
  const ApplyForJob({Key? key, this.userId, this.categoryId, this.jobPost})
      : super(key: key);

  @override
  State<ApplyForJob> createState() => _ApplyForJobState();
}

class _ApplyForJobState extends State<ApplyForJob>
    with SingleTickerProviderStateMixin {
  final QualificationService _qualificationService = QualificationService();
  List<Qualification> _qualificationList = [];

  final _formKey = GlobalKey<FormState>();
  Qualification? dropdownValue;
  bool? isChecked = true;

  _getAllQualifications() async {
    var qualifications = await _qualificationService.allQualification();
    var list = json.decode(qualifications.body);
    List<Qualification> results = [];
    list['data'].forEach((data) {
      var model = Qualification();
      model.id = data["id"];
      model.name = data["name"];
      model.image = data["image"];
      results.add(model);
    });
    if (mounted) {
      setState(() {
        _qualificationList = results;
      });
    }
  }

  @override
  void initState() {
    _getAllQualifications();
    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  bool isLoading = false;

  Future uploadImage() async {
    final uri = Uri.parse(Constant.AddStory);
    var request = http.MultipartRequest("POST", uri);
    request.fields['name'] = _nameController.text;
    request.fields['email'] = _emailController.text;
    request.fields['mobile'] = _mobileController.text;
    request.fields['category_id'] = widget.categoryId.toString();
    request.fields['job_post_id'] = widget.jobPost!.jobTypeId.toString();
    request.fields['qualification_id'] = dropdownValue!.id.toString();
    request.fields['user_id'] = widget.userId.toString();
    var pic = await http.MultipartFile.fromPath('cv', _file!.path);
    request.files.add(pic);

    var response = await request.send();

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('Image uploaded');
      }
      if (mounted) {
        _showAlertDialog(context);

        setState(() {
          isLoading = false;
        });
      }
    } else {
      if (kDebugMode) {
        print("Failed to upload");
      }
    }
  }

  File? _file;
  PlatformFile? _platformFile;
  late AnimationController loadingController;

  selectFile() async {
    final file = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['png', 'jpg', 'pdf']);

    if (file != null) {
      setState(() {
        _file = File(file.files.single.path!);
        _platformFile = file.files.first;
      });
    }

    loadingController.forward();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Apply for this job',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CachedNetworkImage(
                imageUrl: widget.jobPost!.companyLogo!,
                height: 200,
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: selectFile,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.black)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Upload Resume Here'),
                            SizedBox(
                              width: 50,
                            ),
                            Icon(
                              Icons.picture_as_pdf,
                              size: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  _platformFile != null
                      ? Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Selected File',
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade200,
                                          offset: const Offset(0, 1),
                                          blurRadius: 3,
                                          spreadRadius: 2,
                                        )
                                      ]),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _platformFile!.name,
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              '${(_platformFile!.size / 1024).ceil()} KB',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey.shade500),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                                height: 5,
                                                clipBehavior: Clip.hardEdge,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.blue.shade50,
                                                ),
                                                child: LinearProgressIndicator(
                                                  value:
                                                      loadingController.value,
                                                )),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ))
                      : Container(),
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
                            controller: _nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your name as per certificate.';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              labelText: 'Enter your name',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _mobileController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your mobile';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              labelText: 'Enter your mobile',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _emailController,
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: DropdownButton<Qualification>(
                                value: dropdownValue,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 28,
                                elevation: 10,
                                isExpanded: true,
                                autofocus: true,
                                hint: const Text('Select Qualification'),
                                style: const TextStyle(
                                    color: Colors.deepPurple, fontSize: 20),
                                onChanged: (Qualification? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                                borderRadius: BorderRadius.circular(15),
                                items: _qualificationList
                                    .map<DropdownMenuItem<Qualification>>(
                                        (Qualification? value) {
                                  return DropdownMenuItem<Qualification>(
                                    value: value,
                                    child: Text(value!.name!),
                                  );
                                }).toList()),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          // Row(
                          //   children: [
                          //     Checkbox(value: isChecked, onChanged: null),
                          //     const Expanded(
                          //         child: Text(
                          //             'By clicking this check box, You will be accept our terms and conditions'))
                          //   ],
                          // ),
                          !isLoading
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  child: Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        //Navigator.pop(context);
                                        if (_formKey.currentState!.validate()) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content:
                                                    Text('Processing Data')),
                                          );
                                          uploadImage();
                                        }
                                        setState(() {
                                          isLoading = true;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.black45,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: const Text(
                                        'Apply Now',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )
                              : const CircularProgressIndicator(),
                          //Text(_qualificationList![0].id.toString()),
                          // Text(dropdownValue!.id.toString())
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Submitted Successfully'),
        content: Column(
          children: [
            Lottie.asset('assets/animation/success.json', width: 200),
            const Text(
                'Your application has been submitted successfully, You will get a confirmation mail shortly.'),
          ],
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            child: const Text('Home Menu'),
          ),
        ],
      ),
    );
  }
}
