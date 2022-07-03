import 'package:delimeals_self/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static String routeName = "/filter_screen";
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      body: const Center(
        child: Text(
          "this is my filters",
        ),
      ),
    );
  }
}
