import 'package:dvot_dashboard_init/class/api-response.dart';
import 'package:dvot_dashboard_init/class/custom-toast.dart';
import 'package:dvot_dashboard_init/class/post.dart';
import 'package:dvot_dashboard_init/pages/posts/posts-datatable.dart';
import 'package:dvot_dashboard_init/services/api/posts-service.dart';
import 'package:dvot_dashboard_init/widgets/button.dart';
import 'package:dvot_dashboard_init/widgets/total/total-posts.dart';
import 'package:flutter/material.dart';

import '../../widgets/total/total-passed-posts.dart';
import '../../widgets/total/total-users.dart';

class PostsContent extends StatelessWidget {
  const PostsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              child: Text(
                "Gestion Posts",
                style: Theme.of(context).textTheme.headline1,
              ),
              width: double.infinity,
            ),
            flex: 1,
          ),
          const SizedBox(height: 50,),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Expanded(
                  child: TotalPosts(),
                  flex: 2,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Expanded(
                  child: TotalPassedPosts(),
                  flex: 2,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Button(
                    "Ajouter un post",
                    height: 100,
                    onTap: () => {
                      print("Ajout d'utilisateurs")
                    },
                  ),
                  flex: 5,
                ),
              ],
            ),
            flex: 2,
          ),
          const SizedBox(height: 50,),
          Expanded(
            child: FutureBuilder(
              future: PostsService.getAllPosts(0),
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
                        print(apiResponse.message);
                        return Container();
                      }
                      final List<Post> posts = (apiResponse.data)
                          .map((post) => Post.fromJson(post))
                          .toList();
                      if (posts.isEmpty) {
                        return const Center(
                          child: Text("Aucun Post"),
                        );
                      }
                      return PostsDataTable(posts: posts);
                    }
                    break;
                  default:
                    return Container();
                    break;
                }
                return Container();
              },
            ),
            flex: 9,
          ),
        ],
      ),
    );
  }
}
