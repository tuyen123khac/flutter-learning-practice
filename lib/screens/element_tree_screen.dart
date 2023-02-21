import 'dart:developer';

import 'package:flutter/material.dart';

class ElementTreeScreen extends StatefulWidget {
  const ElementTreeScreen({Key? key}) : super(key: key);

  @override
  State<ElementTreeScreen> createState() {
    log('SecondScreen createState');
    return _ElementTreeScreenState();
  }

  @override
  StatefulElement createElement() {
    log('SecondScreen createElement');
    return super.createElement();
  }
}

class _ElementTreeScreenState extends State<ElementTreeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    log('SecondScreen build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Element tree'),
      ),
      body: Center(
        child: _counter % 2 == 0
            ? Container(color: Colors.red, child: MyTextStateful(counter: _counter))
            : Container(color: Colors.yellow, child: MyTextStateful(counter: _counter)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}

/// MyText Stateless widget

class MyText extends StatelessWidget {
  final int counter;

  const MyText({
    Key? key,
    required this.counter,
  }) : super(key: key);

  @override
  StatelessElement createElement() {
    log('MyText createElement');
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    log('MyText build');
    return Text(
      '$counter',
      style:
          Theme.of(context).textTheme.headline1?.copyWith(color: Colors.white),
    );
  }
}

////  Stateful widget

class MyTextStateful extends StatefulWidget {
  final int counter;

  const MyTextStateful({
    Key? key,
    required this.counter,
  }) : super(key: key);

  @override
  StatefulElement createElement() {
    log('$hashCode MyTextStateful createElement');
    return super.createElement();
  }

  @override
  State<MyTextStateful> createState() => _MyTextStatefulState();
}

class _MyTextStatefulState extends State<MyTextStateful> {
  @override
  void initState() {
    log('$hashCode MyTextStateful initState');
    super.initState();
  }

  @override
  void dispose() {
    log('$hashCode MyTextStateful dispose');
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    log('$hashCode MyTextStateful didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant MyTextStateful oldWidget) {
    log('$hashCode MyTextStateful didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    log('$hashCode MyTextStateful build');
    return Text(
      '${widget.counter}',
      style:
          Theme.of(context).textTheme.headline1?.copyWith(color: Colors.white),
    );
  }
}
