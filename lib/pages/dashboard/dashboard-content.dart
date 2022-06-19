import 'package:dvot_dashboard_init/pages/dashboard/dashboard-live.dart';
import 'package:dvot_dashboard_init/pages/dashboard/latest-posts.dart';
import 'package:dvot_dashboard_init/widgets/page-title.dart';
import 'package:dvot_dashboard_init/widgets/total/total-directs.dart';
import 'package:dvot_dashboard_init/widgets/total/total-passed-posts.dart';
import 'package:dvot_dashboard_init/widgets/total/total-posts.dart';
import 'package:dvot_dashboard_init/widgets/total/total-users-active.dart';
import 'package:flutter/material.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({Key? key}) : super(key: key);

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
              child: const PageTitle("Dashboard"),
              width: double.infinity,
            ),
            flex: 1,
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: DashboardLive(),
                  flex: 3,
                ),
                SizedBox(width: 40),
                Expanded(
                  child: LatestPosts(),
                  flex: 2,
                )
              ],
            ),
            flex: 8,
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: TotalUsersActive(),
                  flex: 1,
                ),
                SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: TotalPosts(),
                  flex: 1,
                ),
                SizedBox(width: 40),
                Expanded(
                  child: TotalDirects(),
                  flex: 1,
                ),
                SizedBox(width: 40),
                Expanded(
                  child: TotalPassedPosts(),
                  flex: 1,
                )
              ],
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }
}
