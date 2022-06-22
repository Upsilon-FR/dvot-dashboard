import 'dart:ui';

import 'package:dvot_dashboard_init/class/api-response.dart';
import 'package:dvot_dashboard_init/class/custom-toast.dart';
import 'package:dvot_dashboard_init/pages/dashboard/dashboard.dart';
import 'package:dvot_dashboard_init/pages/login/login-form-input.dart';
import 'package:dvot_dashboard_init/services/api/auth-service.dart';
import 'package:dvot_dashboard_init/widgets/button.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
          child: Column(
            children: [
              const Expanded(
                child: Text(
                  "Connexion",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                  ),
                ),
                flex: 1,
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                flex: 6,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Expanded(
                        child: LoginFormInput(
                          label: "Adresse mail",
                          controller: emailController,
                          required: true,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: LoginFormInput(
                          label: "Mot de passe",
                          controller: passwordController,
                          required: true,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Expanded(
                        child: Button(
                          "Se connecter",
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              ApiResponse response = await AuthService.login(
                                  emailController.text,
                                  passwordController.text);
                              if (!response.error) {
                                Navigator.of(context)
                                    .pushNamed(Dashboard.routeName);
                                CustomToast.showSuccessToast(
                                    msg: response.message, context: context);
                              } else {
                                CustomToast.showErrorToast(
                                    msg: response.message, context: context);
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
