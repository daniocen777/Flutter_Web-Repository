import 'package:bases/ui/pages/counter_page.dart';
import 'package:bases/ui/shared/custom_buttom.dart';
import 'package:flutter/material.dart';

class View404 extends StatelessWidget {
  static const String route = '/404';
  const View404({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('404',
              style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold)),
          SizedBox(height: 10.0),
          Text('No se encontró la página'),
          SizedBox(height: 15.0),
          CustomButtom(
              label: 'Regresar',
              onPressed: () => Navigator.pushNamed(context, CounterPage.route))
        ],
      ),
    );
  }
}
