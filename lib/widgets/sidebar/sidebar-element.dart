import 'package:dvot_dashboard_init/class/custom-toast.dart';
import 'package:dvot_dashboard_init/services/api-services.dart';
import 'package:dvot_dashboard_init/services/api/auth-service.dart';
import 'package:dvot_dashboard_init/services/api/posts-service.dart';
import 'package:flutter/material.dart';

class SideBarElement extends StatelessWidget {
  final String name;
  final String route;
  final IconData icon;

  SideBarElement({Key? key, required this.name, required this.route, required this.icon})
      : super(key: key);

  late bool isSelected;

  @override
  Widget build(BuildContext context) {
    isSelected = name == route;
    return GestureDetector(
      onTap: () async => {
        if(name == "Déconnexion"){
          await AuthService.logout(ApiServices.session["mail"].toString()),
          CustomToast.showSuccessToast(msg: "Utilisateur déconnecté", context: context),
          Navigator.of(context).pushNamed("/")
        }else {
          Navigator.of(context).pushNamed(name)
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? Theme.of(context).primaryColor : Colors.white,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 15,),
                Icon(
                  icon,
                  color: isSelected ? Colors.white : Colors.black,
                ),
                const SizedBox(width: 20,),
                Text(
                  name,
                  style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
