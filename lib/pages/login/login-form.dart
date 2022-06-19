import 'dart:ui';

import 'package:dvot_dashboard_init/class/custom-toast.dart';
import 'package:dvot_dashboard_init/pages/dashboard/dashboard.dart';
import 'package:dvot_dashboard_init/services/apiService.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 500, vertical: 200),
      child: Container(
        width: 360,
        height: 450,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(blurRadius: 11, color: Theme.of(context).backgroundColor),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
          child: Column(
            children: [
              const Text(
                "Connexion",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null) return value;
                        if (value.isEmpty) {
                          return 'Vous devez entrer votre email';
                        }
                        return null;
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).cardColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Adresse mail",
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null) return value;
                        if (value.isEmpty) {
                          return 'Vous devez entrer votre mot de passe';
                        }
                        if (value.length < 3) {
                          return "votre mot de passe est trop petit";
                        } else if (value.length > 30) {
                          return "votre mot de passe est trop grand";
                        }
                      },
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).backgroundColor,
                                style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Mot de passe",
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      child: Center(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Theme.of(context).primaryColor)),
                          onPressed: () async {
                            var success;
                            if (emailController.text == "" ||
                                passwordController.text == "") {
                              CustomToast.showSuccessToast(
                                  msg: "Veuillez renseigner tous les champs",
                                  context: context);
                            } else {
                              success = await ApiServices.login(
                                  emailController.text,
                                  passwordController.text);
                              if (success) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Dashboard()));
                                CustomToast.showSuccessToast(
                                    msg: "Connexion reussie", context: context);
                              } else {
                                CustomToast.showErrorToast(
                                    msg: "Connexion echouée", context: context);
                              }
                            }
                          },
                          child: const Text("Se connecter"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
