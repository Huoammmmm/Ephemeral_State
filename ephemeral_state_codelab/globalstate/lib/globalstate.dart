import 'package:flutter/material.dart';
import 'dart:math';
import 'counter_widget.dart';

class GlobalState extends StatefulWidget {
  @override
  _GlobalState createState() => _GlobalState();
}

class _GlobalState extends State<GlobalState> {
  List<CounterWidget> _counters = [];

  void _removeCounter(Key key) {
    setState(() {
      _counters.removeWhere((element) => element.key == key);
    });
  }

  void _addCounter() {
    final newKey = UniqueKey();
    setState(() {
      _counters.add(CounterWidget(
        key: newKey,
        onRemove: () => _removeCounter(newKey),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Example'),
      ),
      body: ReorderableListView(
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            final item = _counters.removeAt(oldIndex);
            _counters.insert(newIndex, item);
          });
        },
        children: _counters,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}
