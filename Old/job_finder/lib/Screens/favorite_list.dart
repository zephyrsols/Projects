import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../Helper/db_helper.dart';
import '../Models/favorite.dart';
import 'all_favorite.dart';

class FavoriteList extends StatefulWidget {
  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  List<Favorite>? _favoriteList = [];
  bool isLoading = true;

  @override
  void initState() {
    DBHelper.getAll().then((value) {
      setState(() {
        _favoriteList = value!;
        isLoading = false;
        //print(_favoriteList);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("My Bookmarked".tr, style: TextStyle(color: Colors.black),),
        ),
        body: RefreshIndicator(
          onRefresh: () {
            return Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => FavoriteList()));
          },
          child: isLoading
              ? Center(child: Lottie.asset('assets/animation/no_job.json',height: 250))
              : Container(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 48.0),
              child: AllFavoriteHome(
                favoriteList: _favoriteList,
                //categoryList: _categoryList,
              ),
            ),
          ),
        ));
  }
}
