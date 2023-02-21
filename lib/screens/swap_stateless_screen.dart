import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';

class SwapStatelessScreen extends StatefulWidget {
  const SwapStatelessScreen({super.key});

  @override
  State<SwapStatelessScreen> createState() => _SwapStatelessScreenState();
}

class _SwapStatelessScreenState extends State<SwapStatelessScreen> {
  final _listTile = [Tile(), Tile()];
  /////////////////  Tile1  , Tile2  
  ////// SWAP ====>  Tile2  , Tile1

  void _swapTwoTileWidget() {
    setState(() {
      _listTile.insert(1, _listTile.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swap stateless widget'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _listTile,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _swapTwoTileWidget,
        child: const Icon(Icons.swap_horiz),
      ),
    );
  }
}

/// Tile

class Tile extends StatelessWidget {
  final Color color = _generateRandomColor();
  Tile({super.key});

  @override
  StatelessElement createElement() {
    dev.log('$hashCode Tile create element');
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    dev.log('$hashCode Tile build');
    return Container(
      color: color,
      width: 100,
      height: 100,
    );
  }
}

Color _generateRandomColor() {
  final Random random = Random();
  return Color.fromRGBO(
      random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
}
