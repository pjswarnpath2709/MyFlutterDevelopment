import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modals/task_list.dart';
import '../screens/all_tasklist_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => GroupTaskList(),
        ),
      ],
      child: MaterialApp(
        title: 'ToDo List App',
        theme: ThemeData.dark(
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => AllTaskListPage(),
        },
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Your Tasks will be handled here in this App"),
      ),
    );
  }
}
