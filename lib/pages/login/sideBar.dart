import 'package:flutter/material.dart';

class SideBarLogin extends StatelessWidget {
  const SideBarLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 80, 40, 40),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Information",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                ),
              ),
              SizedBox(
                height: 28,
              ),
              Text(
                "Accéder à votre espace adiministrateur et gérez les différents comptes clients, post et lives.\n\n Seules les administrateurs disposant d’un accès sont autorisés à accéder à cette espaces.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: "Roboto",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
