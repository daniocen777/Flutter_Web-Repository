import 'package:bases/ui/shared/custom_app_menu.dart';
import 'package:bases/ui/shared/custom_buttom.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  static const String route = '/stateful';
  const CounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CustomAppMenu(),
        Spacer(),
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
        Spacer(),
      ]),
    );
  }
}
