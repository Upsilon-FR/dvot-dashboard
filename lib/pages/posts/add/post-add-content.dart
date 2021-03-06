import 'package:dvot_dashboard_init/class/api-response.dart';
import 'package:dvot_dashboard_init/class/custom-toast.dart';
import 'package:dvot_dashboard_init/class/post.dart';
import 'package:dvot_dashboard_init/pages/posts/posts.dart';
import 'package:dvot_dashboard_init/services/api/posts-service.dart';
import 'package:dvot_dashboard_init/widgets/add-form-date-input.dart';
import 'package:dvot_dashboard_init/widgets/add-form-input.dart';
import 'package:dvot_dashboard_init/widgets/buttons/button.dart';
import 'package:dvot_dashboard_init/widgets/navigation-history.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostAddContent extends StatefulWidget {
  final Post? post;

  const PostAddContent({Key? key, this.post}) : super(key: key);

  @override
  State<PostAddContent> createState() => _PostAddContentState();
}

class _PostAddContentState extends State<PostAddContent> {
  Post? get post => widget.post;
  TextEditingController titleController = TextEditingController();

  TextEditingController dateVoteController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  DateTime selectedDateTime = DateTime.now();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if (post != null) {
      titleController.text = post!.title;
      dateVoteController.text = post!.dateVote;
      descriptionController.text = post!.description;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              post == null ? "Création post" : "Modification post",
              style: Theme.of(context).textTheme.headline1,
            ),
            flex: 1,
          ),
          Expanded(
            child: PageNavigationHistory(
              first: Posts.routeName,
              second: post == null ? "Création post" : "Modification post",
            ),
            flex: 1,
          ),
          Expanded(
            child: Material(
              elevation: 12,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Expanded(
                        child: AddFormInput(
                          controller: titleController,
                          label: "Titre de loi",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: AddFormDateInput(
                          controller: dateVoteController,
                          label: "Date prévue de vote",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: AddFormInput(
                          controller: descriptionController,
                          label: "Description",
                        ),
                        flex: 9,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(),
                              flex: 4,
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            Expanded(
                              child: Button(
                                widget.post == null ? "Créer" : "Modifier",
                                onTap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    // If the form is valid, display a snackbar. In the real world,
                                    // you'd often call a server or save the information in a database.
                                    ApiResponse response;
                                    if (post == null) {
                                      Post post = Post(
                                        title: titleController.text,
                                        dateVote: dateVoteController.text,
                                        dateCreation: DateFormat("dd/MM/yyy")
                                            .format(DateTime.now()),
                                        etat: "PENDING",
                                        description: descriptionController.text,
                                      );
                                      response = await PostsService.add(post);
                                    } else {
                                      Map<String, dynamic> json = {
                                        "titre": titleController.text,
                                        "date_vote": dateVoteController.text,
                                        "description":
                                            descriptionController.text
                                      };
                                      String id = post!.id ?? "";
                                      response =
                                          await PostsService.update(json, id);
                                    }
                                    if (!response.error) {
                                      Navigator.of(context)
                                          .pushNamed(Posts.routeName);
                                      CustomToast.showSuccessToast(
                                          msg: response.message,
                                          context: context);
                                    } else {
                                      CustomToast.showErrorToast(
                                          msg: response.message,
                                          context: context);
                                    }
                                  }
                                },
                                color: Theme.of(context).primaryColor,
                              ),
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            flex: 20,
          ),
        ],
      ),
    );
  }
}
