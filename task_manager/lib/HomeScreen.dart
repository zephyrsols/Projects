import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:task_manager/ProfileScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4530B3),
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: const Color(0xFF4530B3),
        leadingWidth: 250,
        leading: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            "Ali Hamza",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Tooltip(
              message: "User",
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
                child: SvgPicture.asset(
                  "assets/svg/user_img.svg",
                  height: 25,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
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
                      leading: Tooltip(
                        message: "Search",
                        child: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                      trailing: <Widget>[
                        Tooltip(
                          message: 'Filter',
                          child: GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              "assets/svg/filter_img.svg",
                              height: 25,
                              width: 25,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    );
                  }, suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
                return List<ListTile>.generate(5, (int index) {
                  final String item = 'item $index';
                  return ListTile(
                    title: Text(item),
                    onTap: () {
                      setState(() {
                        controller.closeView(item);
                      });
                    },
                  );
                });
              }),
            ),
            Spacer(),
            Text(
              "Zero Tasks",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
            Spacer(),
            Spacer()
          ],
        ),
      ),
    );
  }

}
