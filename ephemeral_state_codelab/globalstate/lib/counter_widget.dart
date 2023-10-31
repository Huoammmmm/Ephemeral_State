import 'package:flutter/material.dart';
import 'dart:math';

class CounterWidget extends StatefulWidget {
  final Key key;
  final VoidCallback onRemove;

  CounterWidget({required this.key, required this.onRemove}) : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;
  bool _showSnackBar = true;
  late Color _widgetColor;

  void updateCounterText(String newText) {
  setState(() {
    _counter = int.tryParse(newText) ?? _counter;
  });
}

  @override
  void initState() {
    super.initState();
    _widgetColor = _randomColor();
  }

  void _toggleSnackBar() {
    setState(() {
      _showSnackBar = true;
    });
  }

  Color _randomColor() {
    Random randomcolor = Random();
    return Color.fromARGB(255, randomcolor.nextInt(256),
        randomcolor.nextInt(256), randomcolor.nextInt(256));
  }

  void _changeColor() {
    setState(() {
      _widgetColor = _randomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _widgetColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Counter Value: $_counter'),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
            child: Text('Increment'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (_counter > 0) {
                  _counter--;
                } else if (_showSnackBar) {
                  _showSnackBar = false;
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Counter cannot go below zero'),
                    duration: Duration(seconds: 2),
                  ));
                  Future.delayed(Duration(seconds: 2), () {
                    _toggleSnackBar();
                  });
                }
              });
            },
            child: Text('Decrement'),
          ),
          ElevatedButton(
            onPressed: widget.onRemove,
            child: Text('Remove'),
          ),
          ElevatedButton(
            onPressed: _changeColor,
            child: Text('Change Color'),
          ),
        ],
      ),
    );
  }
}