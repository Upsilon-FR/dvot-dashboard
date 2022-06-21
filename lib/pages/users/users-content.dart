import 'package:dvot_dashboard_init/class/api-response.dart';
import 'package:dvot_dashboard_init/class/custom-toast.dart';
import 'package:dvot_dashboard_init/class/user.dart';
import 'package:dvot_dashboard_init/pages/users/users-datatable.dart';
import 'package:dvot_dashboard_init/services/api/user-service.dart';
import 'package:dvot_dashboard_init/widgets/button.dart';
import 'package:dvot_dashboard_init/widgets/total/total-users-active.dart';
import 'package:dvot_dashboard_init/widgets/total/total-users.dart';
import 'package:flutter/material.dart';

import 'add/user-add.dart';

class UsersContent extends StatelessWidget {
  const UsersContent({Key? key}) : super(key: key);

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
                "Gestion Utilisateurs",
                style: Theme.of(context).textTheme.headline1,
              ),
              width: double.infinity,
            ),
            flex: 1,
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Expanded(
                  child: TotalUsers(),
                  flex: 2,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Expanded(
                  child: TotalUsersActive(),
                  flex: 2,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Button(
                    "Ajouter un utilisateur",
                    height: 50,
                    onTap: () => {
                      Navigator.of(context).pushNamed(AddUser.routeName),
                    },
                  ),
                  flex: 5,
                ),
              ],
            ),
            flex: 2,
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: FutureBuilder(
              future: UserService.getAllUsers(),
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
                      final List<User> users = (apiResponse.data)
                          .map((post) => User.fromJson(post))
                          .toList();
                      if (users.isEmpty) {
                        return const Center(
                          child: Text("Aucun Utilisateur"),
                        );
                      }
                      return UsersDataTable(users: users);
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
