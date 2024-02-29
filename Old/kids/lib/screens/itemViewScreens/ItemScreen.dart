import 'package:flutter/material.dart';
import 'package:kids/utils/ItemsView.dart';

class ItemScreen extends StatefulWidget {
  String title = "";
  String svgPath = "";

  ItemScreen({super.key, required this.title, required this.svgPath});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    ItemsView itemsView =
        ItemsView(title: widget.title, svgPath: widget.svgPath);
    return Scaffold(
      body: Container(
        child: itemsView,
      ),
    );
  }
}
