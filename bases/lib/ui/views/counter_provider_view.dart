import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:bases/providers/counter_provider.dart';
import 'package:bases/ui/shared/custom_buttom.dart';

class CounterProviderView extends StatelessWidget {
  static const route = 'provider';
  final String base;
  const CounterProviderView({Key? key, this.base = '300'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => CounterPrivider('5'),
        child: _CounterProviderViewBody());
  }
}

class _CounterProviderViewBody extends StatelessWidget {
  const _CounterProviderViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterPrivider = Provider.of<CounterPrivider>(context);

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
    ]);
  }
}
