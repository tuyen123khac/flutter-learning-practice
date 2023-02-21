import 'package:flutter/material.dart';
import 'package:flutter_learning_practice/navigations/route_names.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget rendering'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, RouteNames.secondScreen),
                child: Text(
                  'Test Element tree',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, RouteNames.thirdScreen),
                child: Text(
                  'Swap Tile stateless',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, RouteNames.forthScreen),
                child: Text(
                  'Swap Tile stateful',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, RouteNames.fifthScreen),
                child: Text(
                  'Listview under the hood',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, RouteNames.sixthScreen),
                child: Text(
                  'Listview update item',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
