import 'dart:developer';

import 'package:flutter/material.dart';

class ListViewUpdateScreen extends StatefulWidget {
  const ListViewUpdateScreen({super.key});

  @override
  State<ListViewUpdateScreen> createState() => _ListViewUpdateScreenState();
}

class _ListViewUpdateScreenState extends State<ListViewUpdateScreen> {
  var _listLength = 10;

  void _increaseItem() {
    setState(() {
      _listLength = _listLength + 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Listview update'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return StatefulItem(title: index.toString());
              },
              itemCount: _listLength,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increaseItem,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class StatefulItem extends StatefulWidget {
  final String title;
  const StatefulItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<StatefulItem> createState() {
    return _StatefulItemState();
  }

  @override
  StatefulElement createElement() {
    log('$hashCode StatefulItem $title createElement');
    return super.createElement();
  }
}

class _StatefulItemState extends State<StatefulItem> {
  @override
  void dispose() {
    log('$hashCode StatefulItem ${widget.title} dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('$hashCode StatelessItem ${widget.title} build');
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      height: 100,
      color: Colors.amber.withOpacity(0.5),
      child: Center(
        child: Text(
          'Item ${widget.title}',
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
