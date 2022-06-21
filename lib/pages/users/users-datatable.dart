import 'package:dvot_dashboard_init/pages/users/user-datatables-actions.dart';
import 'package:dvot_dashboard_init/services/api/user-service.dart';
import 'package:flutter/material.dart';

import '../../class/user.dart';

class UsersDataTable extends StatefulWidget {
  final List<User> users;

  const UsersDataTable({Key? key, required this.users}) : super(key: key);

  @override
  State<UsersDataTable> createState() => _UsersDataTableState();
}

class _UsersDataTableState extends State<UsersDataTable> {

  void onDeleteTap(User user){
    setState(() {
      widget.users.remove(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DataTable(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            horizontalMargin: 15,
            columns: const [
              DataColumn(label: Text("Nom(s)")),
              DataColumn(label: Text("Prénom(s)")),
              DataColumn(label: Text("Date de Naissance")),
              DataColumn(label: Text("Lieu de Naissance")),
              DataColumn(label: Text("Adresse Mail")),
              DataColumn(label: Text("Rôle")),
              DataColumn(label: Text("Actions")),
            ],
            rows: widget.users
                .map(
                  (user) => DataRow(
                    cells: [
                      DataCell(Text(user.lastName)),
                      DataCell(Text(user.firstName)),
                      DataCell(Text(user.birthDate)),
                      DataCell(Text(user.birthPlace)),
                      DataCell(Text(user.mail)),
                      DataCell(Text(user.role),),
                      DataCell(UserDatatablesActions(user: user, onDeleteTap: onDeleteTap,)),
                    ],
                  ),
                )
                .toList(),
            headingRowColor:
                MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
            headingTextStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
