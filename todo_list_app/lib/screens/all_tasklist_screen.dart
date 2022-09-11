import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/modals/task_list.dart';

// ignore: use_key_in_widget_constructors
class AllTaskListPage extends StatelessWidget {
  static const String routeName = "/all-tasklist-screen";

  static final Map<String, IconData> iconMap = {
    'Daily Tasks': Icons.sunny,
    'Important Tasks': Icons.star,
    'All Uncompleted Tasks': Icons.incomplete_circle,
    'CompletedTasks': Icons.check_circle_outline_rounded,
    'Planned Tasks': Icons.calendar_today_rounded,
    'All Tasks': Icons.all_inclusive,
  };

  @override
  Widget build(BuildContext context) {
    final groupTaskListProvider = Provider.of<GroupTaskList>(context);
    final list = groupTaskListProvider.titlesOfCompulsoryList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO"),
        elevation: 5,
        bottomOpacity: 0.4,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 340,
            width: double.infinity,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      iconMap[list[index]],
                      color: Colors.blue,
                    ),
                  ),
                  title: Text(
                    list[index],
                  ),
                  trailing: const CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Text(
                      "0",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  onTap: () {},
                );
              },
              itemCount: list.length,
            ),
          ),
          const Divider(
            height: 8,
            endIndent: 0,
            indent: 0,
            color: Colors.grey,
            thickness: 0.3,
          ),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Column(),
            // color: Colors.blue,
          ),
          const Divider(
            height: 8,
            endIndent: 0,
            indent: 0,
            color: Colors.grey,
            thickness: 0.3,
          ),
          SizedBox(
            height: 63.5,
            width: double.infinity,
            child: Column(),
            // color: Colors.amber,
          ),
        ],
      ),
    );
  }
}
