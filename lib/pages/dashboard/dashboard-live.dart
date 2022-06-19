import 'package:dvot_dashboard_init/widgets/button.dart';
import 'package:flutter/material.dart';

class DashboardLive extends StatelessWidget {
  const DashboardLive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                alignment: Alignment.center,
                fit: BoxFit.cover,
                image: AssetImage("live-photo-dashboard.jpg"),
              )),
            ),
            flex: 3,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Direct : Droit à la pma pour les chevaux genre ils ont besoin d’avorter",
                      ),
                    ),
                    flex: 3,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: Button("Gérer", onTap: ()=>{},),
                    ),
                    flex: 1,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
