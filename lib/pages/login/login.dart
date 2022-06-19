import 'package:dvot_dashboard_init/pages/login/login-form.dart';
import 'package:dvot_dashboard_init/pages/login/sideBar.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: SideBarLogin(),
          flex: 1,
        ),
        Expanded(
          child: LoginForm(),
          flex: 3,
        ),
      ],
    );
  }
}
