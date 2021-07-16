import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';

class CategoriesDTS extends DataTableSource {
  final List<Categoria> categories;
  final BuildContext context;

  CategoriesDTS(this.categories, this.context);

  @override
  DataRow getRow(int index) {
    final category = this.categories[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(category.id)),
      DataCell(Text(category.nombre)),
      DataCell(Text(category.usuario.nombre)),
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (_) => CategoryModal(categoria: category));
              },
              icon: Icon(Icons.edit_outlined)),
          SizedBox(width: 10.0),
          IconButton(
              onPressed: () {
                final dialog = CupertinoAlertDialog(
                    title: Text('Eliminación'),
                    content: Text('Está segur@ de eliminar ${category.nombre}'),
                    actions: [
                      TextButton(
                          child: Text('No'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                      TextButton(
                          child: Text('Sí'),
                          onPressed: () async {
                            await Provider.of<CategoriesProvider>(context,
                                    listen: false)
                                .deleteCategory(category.id);
                            Navigator.of(context).pop();
                          })
                    ]);

                showDialog(context: context, builder: (_) => dialog);
              },
              icon: Icon(Icons.delete_outlined,
                  color: Colors.red.withOpacity(0.8)))
        ],
      ))
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => this.categories.length;

  @override
  int get selectedRowCount => 0;
}
