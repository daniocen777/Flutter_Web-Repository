import 'package:flutter/material.dart';

import 'package:bases/ui/shared/custom_buttom.dart';

class CounterView extends StatefulWidget {
  static const String route = '/stateful';
  final String base;

  const CounterView({Key? key, this.base = '5'}) : super(key: key);

  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int counter = 10;

  @override
  void initState() {
    super.initState();
    if (int.tryParse(widget.base) != null) {
      counter = int.parse(widget.base);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        'Contador usando stateful widget',
        style: TextStyle(fontSize: 20.0),
      ),
      FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Contador: $counter',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 45.0),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButtom(
              label: 'Incrementar',
              onPressed: () {
                setState(() {
                  counter += 1;
                });
              }),
          CustomButtom(
              label: 'Decrementar',
              color: Colors.deepOrange,
              onPressed: () {
                setState(() {
                  counter -= 1;
                });
              })
        ],
      ),
    ]);
  }
}
