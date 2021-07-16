import 'package:flutter/material.dart';

import 'package:admin_dashboard/models/user.dart';
import 'package:admin_dashboard/services/navigation_service.dart';

class UsersDataSource extends DataTableSource {
  final List<Usuario> users;

  UsersDataSource(this.users);

  @override
  DataRow? getRow(int index) {
    final Usuario user = this.users[index];
    final image =
        Image(image: AssetImage('no-image.jpg'), width: 35.0, height: 35.0);
    return DataRow.byIndex(index: index, cells: [
      DataCell(ClipOval(child: image)),
      DataCell(Text('${user.nombre}')),
      DataCell(Text('${user.correo}')),
      DataCell(Text('${user.uid}')),
      DataCell(Row(
        children: [
          IconButton(
              icon: Icon(Icons.edit_outlined,
                  color: Colors.amber.withOpacity(0.8)),
              onPressed: () {
                NavigationService.replaceTo('/dashboard/users/${user.uid}');
              }),
          SizedBox(width: 10.0),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete_outlined,
                  color: Colors.red.withOpacity(0.8))),
        ],
      ))
    ]);
  }

  @override
  bool get isRowCountApproximate => false; // cantidad de datos exacta

  @override
  int get rowCount => this.users.length;

  @override
  int get selectedRowCount => 0;
}
