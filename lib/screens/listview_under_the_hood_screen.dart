import 'dart:developer';

import 'package:flutter/material.dart';

class ListviewUnderTheHoodScreen extends StatefulWidget {
  const ListviewUnderTheHoodScreen({super.key});

  @override
  State<ListviewUnderTheHoodScreen> createState() => _ListviewUnderTheHoodScreenState();
}

class _ListviewUnderTheHoodScreenState extends State<ListviewUnderTheHoodScreen> {
  final _listLength = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Listview under the hood'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return StatefulItem(title: index.toString());
              },
              itemCount: _listLength,
            ))
          ],
        ),
      ),
    );
  }
}

class StatelessItem extends StatelessWidget {
  final String title;
  const StatelessItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  StatelessElement createElement() {
    log('$hashCode StatelessItem $title createElement');
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    log('$hashCode StatelessItem $title build');
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      height: 100,
      color: Colors.green.withOpacity(0.5),
      child: Center(
        child: Text(
          'Item $title',
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: Colors.white),
        ),
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
    log('$hashCode StatefulItem $title createState');
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
  void initState() {
    log('$hashCode StatefulItem ${widget.title} initState');
    super.initState();
  }

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
