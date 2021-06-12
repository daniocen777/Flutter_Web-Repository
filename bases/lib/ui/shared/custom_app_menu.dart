import 'package:bases/locator.dart';
import 'package:bases/services/navigation_service.dart';
import 'package:flutter/material.dart';

import 'package:bases/ui/pages/counter_page.dart';
import 'package:bases/ui/pages/counter_provider_page.dart';
import 'package:bases/ui/shared/custom_buttom.dart';

class CustomAppMenu extends StatelessWidget {
  const CustomAppMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            (constraints.maxWidth > 690.0)
                ? _TabletDesktopMenu()
                : _MobileMenu());
  }
}

class _TabletDesktopMenu extends StatelessWidget {
  const _TabletDesktopMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      width: double.infinity,
      child: Row(
        children: [
          CustomButtom(
              label: 'Contador Stateful',
              color: Colors.black45,
              //onPressed: () => Navigator.pushNamed(context,  CounterPage.route  )),
              onPressed: () =>
                  locator<NavigationService>().navigateTo(CounterPage.route)),
          SizedBox(
            width: 10.0,
          ),
          CustomButtom(
              label: 'Contador Con Provider',
              color: Colors.black45,
              // onPressed: () => Navigator.pushNamed(context, CounterProviderPage.route)),
              onPressed: () => locator<NavigationService>()
                  .navigateTo(CounterProviderPage.route)),
          SizedBox(
            width: 10.0,
          ),
          CustomButtom(
              label: 'Otra Página',
              color: Colors.black45,
              // onPressed: () => Navigator.pushNamed(context, 'routeName')),
              onPressed: () =>
                  locator<NavigationService>().navigateTo('routeName')),
          SizedBox(
            width: 10.0,
          ),
          /* Ruta con parámetros */
          CustomButtom(
              label: 'Contador Stateful con Parámetros',
              color: Colors.black45,
              //onPressed: () => Navigator.pushNamed(context,  CounterPage.route  )),
              onPressed: () => locator<NavigationService>()
                  .navigateTo('${CounterPage.route}/100')),
          /*  Ruta con query params opcionales*/
          SizedBox(
            width: 10.0,
          ),
          CustomButtom(
              label: 'Provider con parámetros opcionales',
              color: Colors.black45,
              // onPressed: () => Navigator.pushNamed(context, CounterProviderPage.route)),
              onPressed: () => locator<NavigationService>()
                  .navigateTo('${CounterProviderPage.route}?q=300')),
        ],
      ),
    );
  }
}

class _MobileMenu extends StatelessWidget {
  const _MobileMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomButtom(
              label: 'Contador Stateful',
              color: Colors.black45,
              //onPressed: () => Navigator.pushNamed(context,  CounterPage.route  )),
              onPressed: () =>
                  locator<NavigationService>().navigateTo(CounterPage.route)),
          SizedBox(
            width: 10.0,
          ),
          CustomButtom(
              label: 'Contador Con Provider',
              color: Colors.black45,
              // onPressed: () => Navigator.pushNamed(context, CounterProviderPage.route)),
              onPressed: () => locator<NavigationService>()
                  .navigateTo(CounterProviderPage.route)),
          SizedBox(
            width: 10.0,
          ),
          CustomButtom(
              label: 'Otra Página',
              color: Colors.black45,
              // onPressed: () => Navigator.pushNamed(context, 'routeName')),
              onPressed: () =>
                  locator<NavigationService>().navigateTo('routeName')),
        ],
      ),
    );
  }
}
