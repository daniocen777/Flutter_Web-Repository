import 'package:flutter/widgets.dart';

import 'package:admin_dashboard/models/http/auth_response.dart';
import 'package:admin_dashboard/models/user.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/routers/routers.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';

enum AuthStatus { checking, authenticated, noAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authState = AuthStatus.checking;
  Usuario? user;

  AuthProvider() {
    this.isAuthenticated();
  }

  void login(String email, String password) {
    final Map<String, dynamic> data = {'correo': email, 'password': password};

    CafeApi.httpPost('/auth/login', data).then((value) {
      final authResponse = AuthResponse.fromMap(value);
      this.user = authResponse.usuario;
      authState = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      CafeApi.configureDio(); // Para tomar el nuevo token
      notifyListeners();
    }).catchError((onError) {
      NotificationsService.showSnackbarError(
          'Usuario o contraseña no son válidos');
    });
  }

  void register(String email, String password, String name) {
    final Map<String, dynamic> data = {
      'nombre': name,
      'correo': email,
      'password': password
    };

    CafeApi.httpPost('/usuarios', data).then((value) {
      final authResponse = AuthResponse.fromMap(value);
      this.user = authResponse.usuario;
      authState = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      CafeApi.configureDio(); // Para tomar el nuevo token
      notifyListeners();
    }).catchError((onError) {
      NotificationsService.showSnackbarError('Usuario ya está registrado');
    });
  }

  void logout() {
    LocalStorage.prefs.remove('token');
    authState = AuthStatus.noAuthenticated;
    notifyListeners();
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');
    if (token == null) {
      authState = AuthStatus.noAuthenticated;
      notifyListeners();
      return false;
    }
    /* Validar token */
    try {
      final response = await CafeApi.httpGet('/auth');
      final authResponse = AuthResponse.fromMap(response);
      this.user = authResponse.usuario;
      authState = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      authState = AuthStatus.noAuthenticated;
      notifyListeners();
      return false;
    }
  }
}
