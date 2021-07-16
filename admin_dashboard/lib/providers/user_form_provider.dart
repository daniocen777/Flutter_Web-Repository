import 'package:flutter/widgets.dart';

import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/user.dart';

class UserFormProvider extends ChangeNotifier {
  late GlobalKey<FormState> formKey;
  Usuario? user;

  /* void updateListeners() {
    notifyListeners();
  } */

  copyUserWith(
      {String? rol,
      bool? estado,
      bool? google,
      String? nombre,
      String? correo,
      String? uid,
      String? img}) {
    this.user = new Usuario(
        rol: rol ?? this.user!.rol,
        estado: estado ?? this.user!.estado,
        google: google ?? this.user!.google,
        nombre: nombre ?? this.user!.nombre,
        correo: correo ?? this.user!.correo,
        uid: uid ?? this.user!.uid);

    notifyListeners();
  }

  bool _validForm() {
    return formKey.currentState!.validate();
  }

  Future<bool> updateUser() async {
    if (!this._validForm()) return false;

    final data = {'nombre': this.user!.nombre, 'correo': this.user!.correo};

    try {
      await CafeApi.httpPut('/usuarios/${this.user!.uid}', data);
      return true;
    } catch (e) {
      print('ERROR => user_form_provider | updateUser() | $e');
      return false;
    }
  }
}
