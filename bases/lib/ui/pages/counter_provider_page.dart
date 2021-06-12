import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:bases/providers/counter_provider.dart';
import 'package:bases/ui/shared/custom_app_menu.dart';
import 'package:bases/ui/shared/custom_buttom.dart';

class CounterProviderPage extends StatelessWidget {
  static const route = 'provider';
  const CounterProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => CounterPrivider('5'),
        child: _CounterProviderPageBody());
  }
}

class _CounterProviderPageBody extends StatelessWidget {
  const _CounterProviderPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterPrivider = Provider.of<CounterPrivider>(context);

    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CustomAppMenu(),
        Spacer(),
        Text(
          'Contador usando Provider',
          style: TextStyle(fontSize: 20.0),
        ),
        FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Contador: ${counterPrivider.counter}',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 45.0),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButtom(
                label: 'Incrementar',
                onPressed: () => counterPrivider.increment()),
            CustomButtom(
                label: 'Decrementar',
                color: Colors.deepOrange,
                onPressed: () => counterPrivider.decrement())
          ],
        ),
        Spacer(),
      ]),
    );
  }
}
