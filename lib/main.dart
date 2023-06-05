import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_learning_practice/hive_manager/hive_manager.dart';
import 'package:flutter_learning_practice/models/person_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveManager.initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hive Package',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Hive main'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PersonModel> listModel = [];

  @override
  void initState() {
    listModel = HiveManager.getAllMyModels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  HiveManager.deleteMyModel(index);
                  listModel = HiveManager.getAllMyModels();
                });
              },
              child: ListTile(
                key: ValueKey(index),
                leading: Text(listModel[index].age.toString()),
                title: Text(listModel[index].name.toString()),
              ),
            );
          },
          itemCount: listModel.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onAddData,
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _onAddData() {
    HiveManager.addMyModel(
      PersonModel(name: 'name', age: Random().nextInt(100)),
    );

    setState(() {
      listModel = HiveManager.getAllMyModels();
    });
  }
}
