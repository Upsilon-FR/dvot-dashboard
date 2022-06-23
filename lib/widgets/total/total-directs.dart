import 'package:dvot_dashboard_init/class/api-response.dart';
import 'package:dvot_dashboard_init/services/api/directs-service.dart';
import 'package:dvot_dashboard_init/widgets/custom-linear-progress-indicator.dart';
import 'package:flutter/material.dart';

class TotalDirects extends StatelessWidget {
  const TotalDirects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      elevation: 15,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Total Directs",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            FutureBuilder(
              future: DirectsService.countDirects(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(
                      child: CustomLinearProgressIndicator(),
                    );
                    break;
                  case ConnectionState.done:
                    final ApiResponse response = snapshot.data;
                    if (!response.error) {
                      return Center(
                        child: Text(
                          response.data[0]["count"].toString(),
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      );
                    }
                    break;
                  default:
                    return Container();
                    break;
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
