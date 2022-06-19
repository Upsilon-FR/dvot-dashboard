import 'package:dvot_dashboard_init/pages/posts/posts-content.dart';
import 'package:dvot_dashboard_init/pages/users/users.dart';
import 'package:dvot_dashboard_init/widgets/sidebar/side-bar.dart';
import 'package:flutter/material.dart';

class Posts extends StatelessWidget {
  static const String routeName = "Posts";
  const Posts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Row(
        children: const [
          Expanded(
            child: SideBar(
              routeName: routeName,
            ),
            flex: 1,
          ),
          Expanded(
            child: PostsContent(),
            flex: 6,
          )
        ],
      ),
    );
  }
}
