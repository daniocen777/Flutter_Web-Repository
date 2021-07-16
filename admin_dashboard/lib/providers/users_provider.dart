import 'package:admin_dashboard/models/http/users_response.dart';
import 'package:flutter/widgets.dart';

import 'package:admin_dashboard/models/user.dart';
import 'package:admin_dashboard/api/cafe_api.dart';

class UsersProvider extends ChangeNotifier {
  List<Usuario> users = [];
  bool isLoading = true;
  bool ascending = true;
  int? sortColumnIndex;

  UsersProvider() {
    this.getPaginatedUsers();
  }

  Future<void> getPaginatedUsers() async {
    final response = await CafeApi.httpGet('/usuarios?limite=100&desde=0');
    final UsersResponse usersResponse = UsersResponse.fromMap(response);
    this.users = [...usersResponse.usuarios];
    this.isLoading = false;

    notifyListeners();
  }

  Future<Usuario?> getUserById(String uid) async {
    try {
      final response = await CafeApi.httpGet('/usuarios/$uid');
      final Usuario user = Usuario.fromMap(response);
      return user;
    } catch (e) {
      return null;
    }
  }

  void sort<T>(Comparable<T> Function(Usuario user) getField) {
    this.users.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    this.ascending = !this.ascending;
    notifyListeners();
  }

  void refreshUser(Usuario newUser) {
    this.users = this.users.map((user) {
      if (user.uid == newUser.uid) {
        user = newUser;
      }
      return user;
    }).toList();
    
    notifyListeners();
  }
}
