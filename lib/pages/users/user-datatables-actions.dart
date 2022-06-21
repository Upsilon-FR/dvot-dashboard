import 'package:dvot_dashboard_init/class/custom-toast.dart';
import 'package:dvot_dashboard_init/class/user.dart';
import 'package:dvot_dashboard_init/pages/users/add/user-add.dart';
import 'package:dvot_dashboard_init/services/api-services.dart';
import 'package:dvot_dashboard_init/services/api/user-service.dart';
import 'package:flutter/material.dart';

class UserDatatablesActions extends StatelessWidget {
  final User user;
  final Function(User) onDeleteTap;

  const UserDatatablesActions(
      {Key? key,
      required this.user,
      required this.onDeleteTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          child: const Icon(Icons.edit),
          onTap: () => Navigator.of(context).pushNamed(AddUser.routeName, arguments: user),
        ),
        GestureDetector(
          child: const Icon(Icons.delete),
          onTap: () async => {
            if(ApiServices.session["mail"] != user.mail){
              await UserService.deleteUser(user),
              CustomToast.showSuccessToast(msg: "Utilisateur supprimé", context: context),
              onDeleteTap(user)
            }else {
              CustomToast.showErrorToast(msg: "Vous ne pouvez pas supprimer votre propre compte", context: context)
            }
          },
        ),
      ],
    );
  }
}
