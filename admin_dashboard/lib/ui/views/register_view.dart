import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

import 'package:admin_dashboard/routers/routers.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_input.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => RegisterFormProvider(),
        child: Builder(
          builder: (context) {
            final _registerFormProvider =
                Provider.of<RegisterFormProvider>(context, listen: false);
            return Container(
                margin: EdgeInsets.only(top: 50.0),
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Center(
                    child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 370.0),
                        child: Form(
                            autovalidateMode: AutovalidateMode.always,
                            key: _registerFormProvider.formKey,
                            child: Column(children: [
                              /* Nombre */
                              TextFormField(
                                  onChanged: (value) =>
                                      _registerFormProvider.name = value,
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return 'El nombre es obligatorio';

                                    return null;
                                  },
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.8)),
                                  decoration: CustomInputs.loginInputDecoration(
                                      hint: 'Ingrese su nombre',
                                      label: 'Nombre',
                                      icon: Icons.person_outline)),
                              SizedBox(height: 20.0),
                              /* Correo */
                              TextFormField(
                                  onChanged: (value) =>
                                      _registerFormProvider.email = value,
                                  validator: (value) {
                                    if (!EmailValidator.validate(value ?? ''))
                                      return 'Correo no v??lido';
                                    return null;
                                  },
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.8)),
                                  decoration: CustomInputs.loginInputDecoration(
                                      hint: 'Ingrese su correo',
                                      label: 'Correo',
                                      icon: Icons.email_outlined)),
                              SizedBox(height: 20.0),
                              /* Contrase??a */
                              TextFormField(
                                  onChanged: (value) =>
                                      _registerFormProvider.password = value,
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return 'Debe ingresar una contrase??a';
                                    if (value.length < 6)
                                      return 'Contrase??a con al menos 6 caracteres';

                                    return null;
                                  },
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.8)),
                                  decoration: CustomInputs.loginInputDecoration(
                                      hint: '**********',
                                      label: 'Contrase??a',
                                      icon: Icons.lock_outline)),
                              SizedBox(height: 20.0),
                              CustomOutlinedButton(
                                  onPress: () {
                                    final validForm =
                                        _registerFormProvider.validateForm();
                                    if (!validForm) return;
                                    /* Registrar */
                                    final authProvider =
                                        Provider.of<AuthProvider>(context,
                                            listen: false);
                                    authProvider.register(
                                        _registerFormProvider.email,
                                        _registerFormProvider.password,
                                        _registerFormProvider.name);
                                  },
                                  text: 'Crear cuenta'),
                              SizedBox(height: 20.0),
                              LinkText(
                                  text: 'Ir al login',
                                  onPress: () => Navigator.pushReplacementNamed(
                                      context, Flurorouter.loginRoute))
                            ])))));
          },
        ));
  }
}
