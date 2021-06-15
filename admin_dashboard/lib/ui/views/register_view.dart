import 'package:flutter/material.dart';

import 'package:admin_dashboard/routers/routers.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_input.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 90.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
            child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 370.0),
          child: Form(
            child: Column(
              children: [
                /* Nombre */
                TextFormField(
                    style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    decoration: CustomInput.authInputDecoration(
                        hint: 'Ingrese su nombre',
                        label: 'Nombre',
                        iconData: Icons.person_outline)),
                SizedBox(height: 20.0),
                /* Correo */
                TextFormField(
                    style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    decoration: CustomInput.authInputDecoration(
                        hint: 'Ingrese su correo',
                        label: 'Correo',
                        iconData: Icons.email_outlined)),
                SizedBox(height: 20.0),
                /* COntraseña */
                TextFormField(
                    style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    decoration: CustomInput.authInputDecoration(
                        hint: '**********',
                        label: 'Contraseña',
                        iconData: Icons.lock_outline)),
                SizedBox(height: 20.0),
                CustomOutlinedButton(onPress: () {}, text: 'Crear cuenta'),
                SizedBox(height: 20.0),
                LinkText(
                    text: 'Ir al login',
                    onPress: () =>
                        Navigator.pushNamed(context, Flurorouter.loginRoute))
              ],
            ),
          ),
        )));
  }
}