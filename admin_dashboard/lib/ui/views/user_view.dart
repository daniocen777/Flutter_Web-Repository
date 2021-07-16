import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/models/user.dart';
import 'package:admin_dashboard/providers/index.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/inputs/custom_input.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class UserView extends StatefulWidget {
  final String uid;

  const UserView({Key? key, required this.uid}) : super(key: key);

  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  Usuario? _user;

  @override
  void initState() {
    super.initState();
    print(widget.uid);
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    final userFormProvider =
        Provider.of<UserFormProvider>(context, listen: false);
    usersProvider.getUserById(widget.uid).then((userDb) {
      if (userDb != null) {
        userFormProvider.user = userDb;
        userFormProvider.formKey = new GlobalKey<FormState>();
        setState(() {
          this._user = userDb;
        });
      } else {
        NavigationService.replaceTo('/dashboard/users');
      }
    });
  }

  @override
  void dispose() {
    this._user = null;
    Provider.of<UserFormProvider>(context).user = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        /* ListView => Para hacer un scroll */
        child: ListView(physics: ClampingScrollPhysics(), children: [
          Text(
            'Usuario',
            style: CustomLabels.h1,
          ),
          SizedBox(height: 10.0),
          if (this._user == null)
            WhiteCard(
                child: Container(
                    alignment: Alignment.center,
                    height: 300.0,
                    child: CircularProgressIndicator())),
          if (this._user != null) _UserViewBody()
        ]));
  }
}

class _UserViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        columnWidths: {
          0: FixedColumnWidth(250.0) // Primera columna
        },
        children: [
          TableRow(children: [
            _AvatarContainer(),
            /* Formulario */
            _UserViewForm()
          ])
        ],
      ),
    );
  }
}

class _UserViewForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userFormProvider = Provider.of<UserFormProvider>(context);
    final _user = _userFormProvider.user!;
    return WhiteCard(
        title: 'Información del Usuario ${_user.correo}',
        child: Form(
            key: _userFormProvider.formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(children: [
              TextFormField(
                initialValue: _user.nombre,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Debe ingresar nombre';
                  if (value.length < 5)
                    return 'Nombre con al menos 6 caracteres';

                  return null;
                },
                onChanged: (value) =>
                    _userFormProvider.copyUserWith(nombre: value),
                decoration: CustomInputs.formInputDecoration(
                    hint: 'Nombre de usuario',
                    label: 'Nombre',
                    icon: Icons.supervised_user_circle_outlined),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                initialValue: _user.correo,
                validator: (value) {
                  if (!EmailValidator.validate(value ?? ''))
                    return 'Correo no válido';
                  return null;
                },
                onChanged: (value) =>
                    _userFormProvider.copyUserWith(correo: value),
                decoration: CustomInputs.formInputDecoration(
                    hint: 'Correo de usuario',
                    label: 'Correo',
                    icon: Icons.mark_email_read_outlined),
              ),
              SizedBox(height: 20.0),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 100.0),
                child: ElevatedButton(
                    onPressed: () async {
                      final saved = await _userFormProvider.updateUser();
                      if (saved) {
                        NotificationsService.showSnackbar(
                            'Usuario actualizado');
                        Provider.of<UsersProvider>(context, listen: false).refreshUser(_user);
                      } else {
                        NotificationsService.showSnackbarError(
                            'Error al actualizar usuario');
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.indigoAccent),
                      shadowColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Row(
                      children: [Icon(Icons.save_outlined), Text('  Guarder')],
                    )),
              )
            ])));
  }
}

class _AvatarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userFormProvider = Provider.of<UserFormProvider>(context);
    final _user = _userFormProvider.user!;
    return WhiteCard(
      width: 250.0,
      child: Container(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Perfil', style: CustomLabels.h2),
                SizedBox(height: 20.0),
                Container(
                    width: 150.0,
                    height: 160.0,
                    child: Stack(children: [
                      ClipOval(child: Image(image: AssetImage('no-image.jpg'))),
                      Positioned(
                        bottom: 5.0,
                        right: 5.0,
                        child: Container(
                          width: 45.0,
                          height: 45.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              border:
                                  Border.all(color: Colors.white, width: 5.0)),
                          child: FloatingActionButton(
                            backgroundColor: Colors.indigoAccent,
                            elevation: 0.0,
                            child: Icon(Icons.camera_alt_outlined, size: 20.0),
                            onPressed: () {},
                          ),
                        ),
                      )
                    ])),
                SizedBox(height: 20.0),
                Text('${_user.nombre}',
                    style: TextStyle(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center),
              ])),
    );
  }
}
