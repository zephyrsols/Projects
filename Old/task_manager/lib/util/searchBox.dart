import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../database/database.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  TaskDatabase taskDatabase = TaskDatabase();
  final _myBox = Hive.box("myBox");

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
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          controller: controller,
          padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0)),
          onTap: () {
            controller.openView();
          },
          onChanged: (_) {
            controller.openView();
          },
          leading: const Tooltip(
            message: "Search",
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        );
      }, suggestionsBuilder:
              (BuildContext context, SearchController controller) {
        return List.generate(
            taskDatabase.taskList.length,
            (index) => ListTile(
                title: Text(taskDatabase.taskList[index][0]),
                onTap: () {
                  setState(() {
                    controller.closeView(taskDatabase.taskList[index][0]);
                  });
                }));
      }),
    );
  }
}
