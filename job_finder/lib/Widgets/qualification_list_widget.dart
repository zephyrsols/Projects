import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:job_finder/Widgets/job_by_qualification.dart';
import '../Models/qualification.dart';

class AllQualificationsWidget extends StatefulWidget {
  final List<Qualification>? qualification;
  const AllQualificationsWidget({Key? key, this.qualification})
      : super(key: key);

  @override
  _AllQualificationsWidgetState createState() =>
      _AllQualificationsWidgetState();
}

class _AllQualificationsWidgetState extends State<AllQualificationsWidget> {
  var colors = [
    Colors.redAccent,
    Colors.blueAccent,
    Colors.cyan,
    Colors.green,
    Colors.yellow,
    Colors.red,
  ];

  Widget? jobByQualification() {
    if (widget.qualification!.isNotEmpty) {
      return Column(
        children: [
          SizedBox(
            height: 250,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1),
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JobsByQualification(
                                    id: widget.qualification![index].id,
                                  )));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors
                              .primaries[
                                  Random().nextInt(Colors.primaries.length)]
                              .shade100,
                          borderRadius: BorderRadius.circular(15)),
                      width: 120,
                      height: 90,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.white,
                              child: FaIcon(
                                FontAwesomeIcons.graduationCap,
                                color: Colors.primaries[
                                    Random().nextInt(Colors.primaries.length)],
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.qualification!.isNotEmpty
                                    ? widget.qualification![index].name!
                                    : '',
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    }
    return const Text("No Data");
  }

  @override
  Widget build(BuildContext context) {
    return jobByQualification() != null
        ? jobByQualification()!
        : const Center(child: CircularProgressIndicator());
  }
}
