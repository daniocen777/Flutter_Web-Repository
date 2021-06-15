import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_background.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/link_bar.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        // ListView => Sus hijos deben tener un tamaño
        body: Scrollbar(
            child: ListView(physics: ClampingScrollPhysics(), children: [
      (size.width > 1000)
          ? _DesktopBody(child: this.child)
          : _MobileBody(child: this.child),
      /* Linksbar */
      LinkBar()
    ])));
  }
}

class _MobileBody extends StatelessWidget {
  final Widget child;
  const _MobileBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black87,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(height: 20.0),
          CustomTitle(),
          Container(width: double.infinity, height: 520.0, child: child),
          Container(
              width: double.infinity, height: 400.0, child: CustomBackground())
        ]));
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;

  const _DesktopBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height * 0.95,
        child: Row(children: [
          /* Twitter background */
          CustomBackground(),
          /* Vistas => Formulario */
          Container(
              width: 600.0,
              height: double.infinity,
              color: Colors.black87,
              child: Column(children: [
                SizedBox(height: 20.0),
                /* Title */
                CustomTitle(),
                SizedBox(height: 30.0),
                /* Formulario */
                Expanded(child: child)
              ]))
        ]));
  }
}
