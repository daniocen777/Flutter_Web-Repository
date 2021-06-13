import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verticalmenu/providers/page_provider.dart';
import 'package:verticalmenu/ui/shared/custom_menu.dart';

import 'package:verticalmenu/ui/views/about_view.dart';
import 'package:verticalmenu/ui/views/contact_view.dart';
import 'package:verticalmenu/ui/views/home_view.dart';
import 'package:verticalmenu/ui/views/location_view.dart';
import 'package:verticalmenu/ui/views/pricing_view.dart';

/* Los 'PAGES' tienen un scaffold, las VIEWS no*/

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _buildBoxDecoration(),
        child: Stack(
          children: [
            /* Vistas y el menú */
            _HomeBody(),
            Positioned(right: 20.0, top: 20.0, child: CustomMenu())
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
      gradient: LinearGradient(
          colors: [Colors.pinkAccent, Colors.amberAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.5, 0.5]));
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // listen: false => No redibujar el widget
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    return PageView(
      controller: pageProvider.scrollController,
      scrollDirection: Axis.vertical,
      children: [
        /* Vistas */
        HomeView(),
        AboutView(),
        ContactView(),
        LocationView(),
        PricingView()
      ],
    );
  }
}
