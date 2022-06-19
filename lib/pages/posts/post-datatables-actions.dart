import 'package:dvot_dashboard_init/class/post.dart';
import 'package:dvot_dashboard_init/services/api-services.dart';
import 'package:dvot_dashboard_init/services/api/posts-service.dart';
import 'package:flutter/material.dart';

class PostDatatablesActions extends StatelessWidget {
  final Post post;
  final Function(Post) onDeleteTap;
  const PostDatatablesActions({Key? key, required this.post, required this.onDeleteTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          child: const Icon(Icons.edit),
          onTap: () => Navigator.of(context).pushNamed("/"),
        ),
        GestureDetector(
          child: const Icon(Icons.delete),
          onTap: () async => {
            await PostsService.deletePost(post),
            onDeleteTap(post)
          }
        ),
      ],
    );
  }
}
