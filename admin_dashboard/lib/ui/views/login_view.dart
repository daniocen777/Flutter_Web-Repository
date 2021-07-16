import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:admin_dashboard/routers/routers.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_input.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authProvider = Provider.of<AuthProvider>(context);
    return ChangeNotifierProvider(
        create: (_) => LoginFormProvider(),
        child: Builder(builder: (context) {
          final _loginFormProvider =
              Provider.of<LoginFormProvider>(context, listen: false);
          return Container(
              margin: EdgeInsets.only(top: 90.0),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 370.0),
                      child: Form(
                          autovalidateMode: AutovalidateMode.always,
                          key: _loginFormProvider.formKey,
                          child: Column(children: [
                            /* Correo */
                            TextFormField(
                              onFieldSubmitted: (_) => _onFormSubmit(
                                  _loginFormProvider, _authProvider),
                              onChanged: (value) =>
                                  _loginFormProvider.email = value,
                              validator: (value) {
                                if (!EmailValidator.validate(value ?? ''))
                                  return 'Correo no válido';
                                return null;
                              },
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.8)),
                              decoration: CustomInputs.loginInputDecoration(
                                  hint: 'Ingrese su correo',
                                  label: 'Correo',
                                  icon: Icons.email_outlined),
                            ),
                            SizedBox(height: 20.0),
                            /* Contraseña */
                            TextFormField(
                                onFieldSubmitted: (_) => _onFormSubmit(
                                    _loginFormProvider, _authProvider),
                                onChanged: (value) =>
                                    _loginFormProvider.password = value,
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return 'Debe ingresar una contraseña';
                                  if (value.length < 5)
                                    return 'Contraseña con al menos 6 caracteres';

                                  return null;
                                },
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.8)),
                                decoration: CustomInputs.loginInputDecoration(
                                    hint: '**********',
                                    label: 'Contraseña',
                                    icon: Icons.lock_outline)),
                            SizedBox(height: 20.0),
                            CustomOutlinedButton(
                                onPress: () => _onFormSubmit(
                                    _loginFormProvider, _authProvider),
                                text: 'Ingresar'),
                            SizedBox(height: 20.0),
                            LinkText(
                                text: 'Nueva cuenta',
                                onPress: () => Navigator.pushReplacementNamed(
                                    context, Flurorouter.registerRoute))
                          ])))));
        }));
  }

  void _onFormSubmit(
      LoginFormProvider loginFormProvider, AuthProvider authProvider) {
    final isValid = loginFormProvider.validateForm();
    if (isValid)
      authProvider.login(loginFormProvider.email, loginFormProvider.password);
  }
}
