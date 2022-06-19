import 'package:dvot_dashboard_init/class/custom-toast.dart';
import 'package:dvot_dashboard_init/pages/dashboard/latest-posts-list-item.dart';
import 'package:dvot_dashboard_init/services/api/posts-service.dart';
import 'package:flutter/material.dart';

import '../../class/api-response.dart';
import '../../class/post.dart';

class LatestPosts extends StatelessWidget {
  const LatestPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Derniers Posts",
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              height: 30,
            ),
            FutureBuilder(
              future: PostsService.getAllPosts(6),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                    break;
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      CustomToast.showErrorToast(
                          msg: snapshot.error.toString(), context: context);
                    }
                    if (snapshot.hasData) {
                      final ApiResponse apiResponse = snapshot.data;
                      if (apiResponse.error) {
                        CustomToast.showErrorToast(
                            msg: apiResponse.message, context: context);
                        return Container();
                      }
                      final List<Post> latestPosts = (apiResponse.data)
                          .map((post) => Post.fromJson(post))
                          .toList();
                      if (latestPosts.isEmpty) {
                        return const Center(
                          child: Text("Aucun post récent"),
                        );
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: latestPosts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return LatestPostsItem(post: latestPosts[index]);
                        },
                      );
                    }
                    break;
                  default:
                    return Container();
                    break;
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
