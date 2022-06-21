import 'package:dvot_dashboard_init/class/post.dart';
import 'package:dvot_dashboard_init/pages/posts/add/post-add-content.dart';
import 'package:dvot_dashboard_init/pages/posts/posts.dart';
import 'package:dvot_dashboard_init/widgets/sidebar/side-bar.dart';
import 'package:flutter/material.dart';

class PostAdd extends StatelessWidget {
  static const routeName = "Ajout Post";
  final Post? post;

  const PostAdd({Key? key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Row(
        children: [
          const Expanded(
            child: SideBar(
              routeName: Posts.routeName,
            ),
            flex: 1,
          ),
          Expanded(
            child: PostAddContent(
              post: post,
            ),
            flex: 6,
          )
        ],
      ),
    );
  }
}
