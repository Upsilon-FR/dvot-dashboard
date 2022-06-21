import 'package:dvot_dashboard_init/class/api-response.dart';
import 'package:dvot_dashboard_init/class/custom-toast.dart';
import 'package:dvot_dashboard_init/class/direct.dart';
import 'package:dvot_dashboard_init/pages/directs/direct-datatable.dart';
import 'package:dvot_dashboard_init/pages/directs/directs.dart';
import 'package:dvot_dashboard_init/pages/directs/last-direct.dart';
import 'package:dvot_dashboard_init/services/api/directs-service.dart';
import 'package:dvot_dashboard_init/widgets/button.dart';
import 'package:dvot_dashboard_init/widgets/total/total-directs.dart';
import 'package:flutter/material.dart';

class DirectsContent extends StatelessWidget {
  const DirectsContent({Key? key}) : super(key: key);

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
                "Gestion Directs",
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
                  child: TotalDirects(),
                  flex: 2,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Expanded(
                  child: TotalDirects(),
                  flex: 2,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Button(
                    "Nouveau Direct",
                    onTap: () => {Navigator.of(context).pushNamed("/")},
                  ),
                  flex: 5,
                ),
              ],
            ),
            flex: 3,
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Row(
              children: [
                const Expanded(
                  child: LatestDirect(),
                  flex: 1,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: FutureBuilder(
                    future: DirectsService.getAll(),
                    builder: (BuildContext context, AsyncSnapshot snapshot){
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
                            final List<Direct> directs = (apiResponse.data)
                                .map((json) => Direct.fromJson(json))
                                .toList();
                            if (directs.isEmpty) {
                              return const Center(
                                child: Text("Aucun Post"),
                              );
                            }
                            return DirectsDatatable(directs: directs);
                          }
                          break;
                        default:
                          return Container();
                          break;
                      }
                      return Container();
                    },
                  ),
                  flex: 3,
                ),
              ],
            ),
            flex: 11,
          ),
        ],
      ),
    );
  }
}
