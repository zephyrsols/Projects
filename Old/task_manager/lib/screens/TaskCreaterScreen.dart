import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:task_manager/database/database.dart';

class TaskCreaterSCreen extends StatefulWidget {
  const TaskCreaterSCreen({super.key});

  @override
  State<TaskCreaterSCreen> createState() => _TaskCreaterSCreenState();
}

class _TaskCreaterSCreenState extends State<TaskCreaterSCreen> {
  TextEditingController taskName = TextEditingController();
  TextEditingController description = TextEditingController();
  final _myBox = Hive.box("myBox");

  int yellowClr = 0x80fbbc05;
  int pinkClr = 0xffffc3bd;
  int greenClr = 0x8062fe03;
  int darkPinkClr = 0x80fa00ff;
  int selectedClr = 0x80fbbc05;
  TimeOfDay? startTime = TimeOfDay.now();
  TimeOfDay? endTime = TimeOfDay.now();
  TaskDatabase taskDatabase = TaskDatabase();

  var today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusDay) {
    setState(() {
      today = day;
    });
  }

  @override
  void initState() {
    //if user first time open the app
    if (_myBox.get("NEWTASKLIST") == null) {
      taskDatabase.createInitialData();
    } else {
      //if user already opened the app
      taskDatabase.loadData();
    }
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final startHours = startTime?.hour.toString().padLeft(2, "0");
    final startMint = startTime?.minute.toString().padLeft(2, "0");
    final endHours = endTime?.hour.toString().padLeft(2, "0");
    final endMint = endTime?.minute.toString().padLeft(2, "0");

    return Scaffold(
      backgroundColor: const Color(0xFFDBE9F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFDBE9F6),
        title: const Text(
          "Create Task",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
        child: ListView(
          children: [
            TableCalendar(
              calendarFormat: CalendarFormat.week,
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleTextStyle: TextStyle(fontSize: 20),
                leftChevronMargin: EdgeInsets.zero,
                leftChevronPadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                rightChevronMargin: EdgeInsets.zero,
                rightChevronPadding: EdgeInsets.zero,
              ),
              availableGestures: AvailableGestures.all,
              focusedDay: today,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2050, 12, 30),
              onDaySelected: _onDaySelected,
              selectedDayPredicate: (day) => isSameDay(day, today),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Task Name",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black26),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: taskName,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "what you up to?",
                      hintStyle: TextStyle(color: Colors.white70)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Description",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black26),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  controller: description,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "write something...",
                      hintStyle: TextStyle(color: Colors.white70)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Spacer(),
                Column(
                  children: [
                    const Text(
                      "Start Time",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black26),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: GestureDetector(
                          onTap: () async {
                            TimeOfDay? time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (time != null) {
                              setState(() {
                                startTime = time;
                              });
                            }
                          },
                          child: Text("${startHours}:${startMint}",
                              style: const TextStyle(
                                  color: Colors.white70, fontSize: 17)),
                        ),
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    const Text(
                      "End Time",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black26),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: GestureDetector(
                          onTap: () async {
                            TimeOfDay? time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (time != null) {
                              setState(() {
                                endTime = time;
                              });
                              if (startTime!.hour == endTime!.hour) {
                                if (startTime!.minute > endTime!.minute ||
                                    startTime!.minute == endTime!.minute) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "End time must be greater than start time.")));
                                }
                              } else if (startTime!.hour > endTime!.hour) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "End time must be greater than start time.")));
                              }
                            }
                          },
                          child: Text("$endHours:$endMint",
                              style: const TextStyle(
                                  color: Colors.white70, fontSize: 17)),
                        ),
                      ),
                    )
                  ],
                ),
                const Spacer(),
              ],
            ),
            const Text(
              "Color",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedClr = yellowClr;
                      yellowClr = 0xff4530B3;
                      pinkClr = 0xffffc3bd;
                      greenClr = 0x8062fe03;
                      darkPinkClr = 0x80fa00ff;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(yellowClr)),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0x80fbbc05),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedClr = pinkClr;
                      yellowClr = 0x80fbbc05;
                      pinkClr = 0xff4530B3;
                      greenClr = 0x8062fe03;
                      darkPinkClr = 0x80fa00ff;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(pinkClr)),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0xffffc3bd),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedClr = greenClr;
                      yellowClr = 0x80fbbc05;
                      pinkClr = 0xffffc3bd;
                      greenClr = 0xff4530B3;
                      darkPinkClr = 0x80fa00ff;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(greenClr)),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0x8062fe03),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedClr = darkPinkClr;
                      yellowClr = 0x80fbbc05;
                      pinkClr = 0xffffc3bd;
                      greenClr = 0x8062fe03;
                      darkPinkClr = 0xff4530B3;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(darkPinkClr)),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0x80fa00ff),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Clear",
                      style: TextStyle(color: Colors.black),
                    )),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (taskName.text == "" || description.text == "") {
                      if(taskName.text == "") {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(
                            "Add title!")));
                      }
                      if(description.text == "") {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(
                            "Add description!")));
                      }
                    } else {
                      taskDatabase.taskList.add([
                        taskName.text,
                        description.text,
                        "${today.day.toString().padLeft(2, "0")}-${today.month.toString().padLeft(2, "0")}",
                        selectedClr,
                        false
                      ]);
                    }
                    taskName.clear();
                    description.clear();

                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Task Added!")));
                    taskDatabase.updateDatabase();
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => const Color(0xff1DBEF5))),
                  child: const Text(
                    "Add Task",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
