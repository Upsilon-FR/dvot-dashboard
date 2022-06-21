import 'package:dvot_dashboard_init/class/direct.dart';
import 'package:dvot_dashboard_init/pages/directs/direct-datatbles-actions.dart';
import 'package:dvot_dashboard_init/widgets/datatables/data-cell.dart';
import 'package:flutter/material.dart';

class DirectsDatatable extends StatefulWidget {
  final List<Direct> directs;

  const DirectsDatatable({Key? key, required this.directs}) : super(key: key);

  @override
  State<DirectsDatatable> createState() => _DirectsDatatableState();
}

class _DirectsDatatableState extends State<DirectsDatatable> {

  void onDeleteTap(Direct direct) {
    setState(() {
      widget.directs.remove(direct);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      elevation: 15,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            headingTextStyle: Theme.of(context).textTheme.bodyText2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            horizontalMargin: 15,
            columns: const [
              DataColumn(label: Text("Titre")),
              DataColumn(label: Text("Description")),
              DataColumn(label: Text("Lien")),
              DataColumn(label: Text("Date")),
              DataColumn(label: Text("Auteur")),
              DataColumn(label: Text("Live")),
              DataColumn(label: Text("Actions")),
            ],
            rows: widget.directs
                .map(
                  (direct) =>
                  DataRow(
                    cells: [
                      DataCell(CustomDataCell(direct.title),),
                      DataCell(CustomDataCell(direct.description),),
                      DataCell(CustomDataCell(direct.link),),
                      DataCell(CustomDataCell(direct.date),),
                      DataCell(CustomDataCell(direct.author),),
                      DataCell(
                        direct.live ? const Icon(Icons.adjust,color: Colors.red,) : Container(),
                      ),
                      DataCell(
                        DirectDatatablesActions(
                          direct: direct, onDeleteTap: onDeleteTap,
                        ),
                      ),
                    ],
                  ),
            )
                .toList(),
            headingRowColor:
            MaterialStateProperty.all<Color>(Theme
                .of(context)
                .primaryColor),
          ),
        ),
      ),
    );
  }
}
