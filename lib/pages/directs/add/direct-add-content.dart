import 'package:dvot_dashboard_init/class/api-response.dart';
import 'package:dvot_dashboard_init/class/custom-toast.dart';
import 'package:dvot_dashboard_init/class/direct.dart';
import 'package:dvot_dashboard_init/pages/directs/directs.dart';
import 'package:dvot_dashboard_init/services/api/directs-service.dart';
import 'package:dvot_dashboard_init/widgets/add-form-date-input.dart';
import 'package:dvot_dashboard_init/widgets/add-form-input.dart';
import 'package:dvot_dashboard_init/widgets/buttons/button.dart';
import 'package:dvot_dashboard_init/widgets/navigation-history.dart';
import 'package:dvot_dashboard_init/widgets/page-title.dart';
import 'package:flutter/material.dart';

class DirectAddContent extends StatefulWidget {
  final Direct? direct;

  const DirectAddContent({Key? key, required this.direct}) : super(key: key);

  @override
  State<DirectAddContent> createState() => _DirectAddContentState();
}

class _DirectAddContentState extends State<DirectAddContent> {
  Direct? get direct => widget.direct;

  TextEditingController titleController = TextEditingController();

  TextEditingController descirptionController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController linkController = TextEditingController();

  TextEditingController authorController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    linkController.text = "https://";
    if (direct != null) {
      titleController.text = direct!.title;
      descirptionController.text = direct!.description;
      dateController.text = direct!.date;
      linkController.text = direct!.link;
      authorController.text = direct!.author;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: PageTitle(
              direct == null ? "Création Direct" : "Modification Direct",
            ),
            flex: 1,
          ),
          Expanded(
            child: PageNavigationHistory(
              first: Directs.routeName,
              second:
                  direct == null ? "Création Direct" : "Modification Direct",
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
                          label: 'Titre du Direct',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: AddFormInput(
                          controller: descirptionController,
                          label: "Description",
                        ),
                        flex: 9,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: AddFormDateInput(
                                controller: dateController,
                                label: 'Date du Direct',
                              ),
                            ),
                            const SizedBox(width: 20,),
                            Expanded(
                              child: AddFormInput(
                                controller: authorController,
                                label: "Demandeur du Direct",
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: AddFormInput(
                          controller: linkController,
                          label: "Lien du Direct",
                        ),
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
                                widget.direct == null ? "Créer" : "Modifier",
                                onTap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    // If the form is valid, display a snackbar. In the real world,
                                    // you'd often call a server or save the information in a database.
                                    ApiResponse response;
                                    if (direct == null) {
                                      Direct newDirect = Direct(
                                        title: titleController.text,
                                        description: descirptionController.text,
                                        link: linkController.text,
                                        date: dateController.text,
                                        author: authorController.text,
                                        live: false,
                                        spectators: 0,
                                      );
                                      response = await DirectsService.add(newDirect);
                                    } else {
                                      Map<String, dynamic> json = {
                                        "titre": titleController.text,
                                        "description": descirptionController.text,
                                        "lien": linkController.text,
                                        "date": dateController.text,
                                        "auteur": authorController.text,
                                      };
                                      String id = direct?.id ?? "";
                                      response =
                                          await DirectsService.update(json, id);
                                    }
                                    if (!response.error) {
                                      Navigator.of(context)
                                          .pushNamed(Directs.routeName);
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
          )
        ],
      ),
    );
  }
}
