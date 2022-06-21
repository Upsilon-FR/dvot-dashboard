import 'package:dvot_dashboard_init/class/post.dart';
import 'package:dvot_dashboard_init/pages/posts/post-datatables-actions.dart';
import 'package:dvot_dashboard_init/widgets/datatables/data-cell.dart';
import 'package:flutter/material.dart';

class PostsDataTable extends StatefulWidget {
  final List<Post> posts;
  const PostsDataTable({Key? key, required this.posts}) : super(key: key);

  @override
  State<PostsDataTable> createState() => _PostsDatatableState();
}

class _PostsDatatableState extends State<PostsDataTable> {

  void onDeleteTap(Post post){
    setState(() {
      widget.posts.remove(post);
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            horizontalMargin: 15,
            columns: const [
              DataColumn(label: Text("Titre")),
              DataColumn(label: Text("Description")),
              DataColumn(label: Text("Date de Création")),
              DataColumn(label: Text("Etat")),
              DataColumn(label: Text("Actions")),
            ],
            rows: widget.posts
                .map(
                  (post) => DataRow(
                cells: [
                  DataCell(CustomDataCell(post.title)),
                  DataCell(CustomDataCell(post.description)),
                  DataCell(CustomDataCell(post.dateCreation)),
                  DataCell(CustomDataCell(post.etat)),
                  DataCell(PostDatatablesActions(post: post, onDeleteTap: onDeleteTap,)),
                ],
              ),
            )
                .toList(),
            headingRowColor:
            MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
            headingTextStyle: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ),
    );
  }
}
