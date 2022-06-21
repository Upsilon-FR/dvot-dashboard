import 'package:dvot_dashboard_init/class/api-response.dart';
import 'package:dvot_dashboard_init/class/custom-toast.dart';
import 'package:dvot_dashboard_init/widgets/add-form-input.dart';
import 'package:dvot_dashboard_init/pages/users/users.dart';
import 'package:dvot_dashboard_init/services/api/user-service.dart';
import 'package:dvot_dashboard_init/widgets/button.dart';
import 'package:dvot_dashboard_init/widgets/dropdown/dropdown.dart';
import 'package:flutter/material.dart';

import '../../../class/user.dart';

class AddUserContent extends StatefulWidget {
  final User? user;

  const AddUserContent({Key? key, this.user}) : super(key: key);

  @override
  State<AddUserContent> createState() => _AddUserContentState();
}

class _AddUserContentState extends State<AddUserContent> {
  User? get user => widget.user;
  TextEditingController lastNameController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController birthPlaceController = TextEditingController();

  TextEditingController birthDateController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String roleSelected = "ADMIN";
  String genderSelected = "M";

  List<Map<String, String>> roles = [
    {'text': "ADMIN", 'value': "ADMIN"},
    {'text': "CITOYEN", 'value': "CITOYEN"},
    {'text': "POLITICIEN", 'value': "POLITICIEN"},
  ];

  List<Map<String, String>> genders = [
    {'text': "M", 'value': "M"},
    {'text': "F", 'value': "F"},
  ];

  onChangeRole(String newRole) {
    setState(() {
      roleSelected = newRole;
    });
  }

  onChangeGender(String newGender) {
    setState(() {
      genderSelected = newGender;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (user != null) {
      lastNameController.text = user!.lastName;
      firstNameController.text = user!.firstName;
      birthPlaceController.text = user!.birthPlace;
      birthDateController.text = user!.birthDate;
      emailController.text = user!.mail;
      roleSelected = user!.role;
      genderSelected = user!.gender;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              user == null
                  ? "Création utilisateur"
                  : "Modification utilisateur",
              style: Theme.of(context).textTheme.headline1,
            ),
            flex: 1,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Text(
                    "Gestion utilisateurs ",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                const Text(
                  "> ",
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  user == null ? "Création utilisateur" : "Modification utilisateur",
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: AddFormInput(
                                controller: lastNameController,
                                label: "Nom",
                              ),
                              flex: 1,
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            Expanded(
                              child: AddFormInput(
                                controller: firstNameController,
                                label: "Prénom",
                              ),
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: AddFormInput(
                                controller: birthPlaceController,
                                label: "Lieu de Naissance",
                              ),
                              flex: 2,
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            Expanded(
                              child: AddFormInput(
                                controller: birthDateController,
                                label: "Date De Naissace",
                              ),
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomDropdown(
                                onChange: onChangeGender,
                                list: genders,
                                label: "Gender",
                                value: genderSelected,
                              ),
                              flex: 1,
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            Expanded(
                              child: AddFormInput(
                                controller: emailController,
                                label: "Email",
                              ),
                              flex: 3,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomDropdown(
                                list: roles,
                                onChange: onChangeRole,
                                label: "Role",
                                value: roleSelected,
                              ),
                              flex: 1,
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            Expanded(
                              child: Container(),
                              flex: 1,
                            ),
                          ],
                        ),
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
                                user == null ? "Créer" : "Modifier",
                                onTap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    // If the form is valid, display a snackbar. In the real world,
                                    // you'd often call a server or save the information in a database.
                                    ApiResponse response;
                                    User user = User(
                                        lastName: lastNameController.text,
                                        firstName: firstNameController.text,
                                        mail: emailController.text,
                                        birthDate: birthDateController.text,
                                        birthPlace: birthPlaceController.text,
                                        gender: genderSelected,
                                        role: roleSelected);
                                    if(this.user == null) {
                                      response =
                                      await UserService.add(user);
                                    }else {
                                      String mail = this.user?.mail ?? "";
                                      response = await UserService.update(user, mail);
                                    }
                                    if (!response.error) {
                                      Navigator.of(context)
                                          .pushNamed(Users.routeName);
                                    }
                                    CustomToast.showSuccessToast(
                                        msg: response.message,
                                        context: context);
                                  }
                                },
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
            flex: 9,
          ),
        ],
      ),
    );
  }
}
