import 'package:dvot_dashboard_init/pages/posts/add/post-add.dart';
import 'package:dvot_dashboard_init/pages/posts/posts.dart';
import 'package:flutter/material.dart';

import '../../class/post.dart';

class LatestPostsItem extends StatelessWidget {
  final Post post;

  const LatestPostsItem({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor,
        ),
        child: Row(children: [
          const Expanded(
            child: Icon(
              Icons.turned_in_not,
              color: Colors.white,
              size: 40,
            ),
            flex: 1,
          ),
          Expanded(
            child: Text(
              post.title,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            flex: 6,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => {
                  Navigator.of(context).pushNamed(PostAdd.routeName, arguments: post),
                },
                child: const Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

// ListTile(
// onTap: () => Navigator.of(context).pushNamed(Posts.routeName),
// style: ListTileStyle.list,
// leading: const Icon(Icons.turned_in_not),
// title: Text(post.title),
// subtitle: Text(post.etat),
// );
