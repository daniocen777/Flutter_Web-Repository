import 'package:admin_dashboard/datatables/users_datasource.dart';
import 'package:admin_dashboard/providers/index.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:provider/provider.dart';

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _usersProvider = Provider.of<UsersProvider>(context);
    final _userDataSource = new UsersDataSource(_usersProvider.users);

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        /* ListView => Para hacer un scroll */
        child: ListView(physics: ClampingScrollPhysics(), children: [
          Text('Usuarios', style: CustomLabels.h1),
          SizedBox(height: 10.0),
          PaginatedDataTable(
              sortAscending: _usersProvider.ascending,
              sortColumnIndex: _usersProvider.sortColumnIndex,
              columns: [
                DataColumn(label: Text('Avatar')),
                DataColumn(
                    label: Text('Nombre'),
                    onSort: (position, asc) {
                      _usersProvider.sortColumnIndex = position;
                      _usersProvider.sort<String>((user) => user.nombre);
                    }),
                DataColumn(
                    label: Text('Email'),
                    onSort: (position, asc) {
                      _usersProvider.sortColumnIndex = position;
                      _usersProvider.sort<String>((user) => user.correo);
                    }),
                DataColumn(label: Text('Uid')),
                DataColumn(label: Text('Acciones')),
              ],
              source: _userDataSource)
        ]));
  }
}
