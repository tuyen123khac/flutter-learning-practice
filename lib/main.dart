import 'package:flutter/material.dart';
import 'package:flutter_learning_practice/data/app_database.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _todoCount = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test Drift DB'),
          backgroundColor: Colors.purple,
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: _onPressInitDB,
                  child: Text('InitDB'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onPressInitDB() async {
    _todoCount++;
    final database = AppDatabase();
    await database.into(database.todos).insert(TodosCompanion.insert(
        title: 'Hoc bai $_todoCount', content: 'Hoc Drift DB $_todoCount'));

    final allTodo = await database.select(database.todos).get();
    print('All todo is: $allTodo');
  }
}
