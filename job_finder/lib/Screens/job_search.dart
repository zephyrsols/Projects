import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:job_finder/Models/job_post.dart';
import 'package:job_finder/Screens/job_details.dart';

class JobSearch extends SearchDelegate<String?> {
  final List<JobPost>? jobPost;
  JobSearch({this.jobPost});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    final recipeSearchList = query.isEmpty
        ? jobPost!
        : jobPost!.where((recipe) {
      return recipe.jobTitle!.toLowerCase().contains(query.toLowerCase()) ||
          recipe.jobDescription!.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return ListView.builder(
        itemCount: recipeSearchList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => JobDetails(
                          jobPost: recipeSearchList[index],
                        )));
              },
              child: Column(
                children: [
                  ListTile(
                    leading: Image.network(
                      recipeSearchList[index].companyLogo!,
                      height: 80,
                      width: 80,
                      fit: BoxFit.fill,
                    ),
                    title: Text(recipeSearchList[index].companyName!),
                    //subtitle: Text(recipeSearchList[index].details!.replaceAll("\\<.*?\\>", ""), maxLines: 1,),
                    subtitle: Html(
                      data: recipeSearchList[index].jobDescription!,
                      style: {
                        "data": Style(fontSize: FontSize.medium, maxLines: 3),
                        "html": Style(maxLines: 3),
                        'h1': Style(
                            fontSize: FontSize.medium,
                            fontWeight: FontWeight.normal)
                      },
                    ),
                  ),
                  Container(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "ReadMoreText",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.end,
                        ),
                      ))
                ],
              ),
            ),
          );
        });
    //throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final recipeSearchList = query.isEmpty
        ? jobPost!
        : jobPost!.where((recipe) {
      return recipe.jobTitle!.toLowerCase().contains(query.toLowerCase()) ||
          recipe.jobDescription!.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return ListView.builder(
        itemCount: recipeSearchList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => JobDetails(
                          jobPost: recipeSearchList[index],
                        )));
              },
              leading: Image.network(
                recipeSearchList[index].companyLogo!,
                height: 80,
                width: 80,
                fit: BoxFit.fill,
              ),
              title: Text(recipeSearchList[index].jobTitle!),
              //subtitle: Text(recipeSearchList[index].details!.replaceAll("\\<.*?\\>", ""), maxLines: 1,),
              subtitle: Html(
                data: recipeSearchList[index].jobDescription!,
                style: {
                  "data": Style(fontSize: FontSize.medium, maxLines: 1),
                  "html": Style(maxLines: 1),
                  'h1': Style(
                      fontSize: FontSize.medium, fontWeight: FontWeight.normal)
                },
              ),
            ),
          );
        });
  }
}
