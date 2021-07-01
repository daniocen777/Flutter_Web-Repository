import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
          width: 30.0,
          height: 30.0,
          child: Image.network(
              'https://www.hola.com/imagenes/estar-bien/20201126179938/personalidad-timida-caracteristicas/0-893-733/mujer-timida-4m-m.jpg')),
    );
  }
}
