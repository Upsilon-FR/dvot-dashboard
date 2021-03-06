

import 'dart:html';

import 'package:dvot_dashboard_init/class/direct.dart';
import 'package:dvot_dashboard_init/class/post.dart';
import 'package:dvot_dashboard_init/class/user.dart';
import 'package:dvot_dashboard_init/pages/dashboard/dashboard.dart';
import 'package:dvot_dashboard_init/pages/directs/add/direct-add.dart';
import 'package:dvot_dashboard_init/pages/directs/directs.dart';
import 'package:dvot_dashboard_init/pages/directs/settings/direct-settings.dart';
import 'package:dvot_dashboard_init/pages/login/login.dart';
import 'package:dvot_dashboard_init/pages/page404.dart';
import 'package:dvot_dashboard_init/pages/posts/add/post-add.dart';
import 'package:dvot_dashboard_init/pages/posts/posts.dart';
import 'package:dvot_dashboard_init/pages/users/add/user-add.dart';
import 'package:dvot_dashboard_init/pages/users/users.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Storage session = window.localStorage;
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DVOT - Dashboard",
      theme: ThemeData(
        backgroundColor: const Color(0xffe5e5e5),
        canvasColor: const Color(0xffdddfE3),
        primaryColor: const Color(0xff0762C8),
        cardColor: const Color(0xfff1f7ff),
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Color(0xFF2B3548),
            fontSize: 28,
            fontWeight: FontWeight.bold
          ),
          headline2: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold
          ),
          bodyText1: TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.normal
          ),
          bodyText2: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          subtitle1: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Color(0xFF2B3548),
          ),
          subtitle2: TextStyle(
              fontSize: 15,
              color: Color(0xff0762C8),
              fontWeight: FontWeight.normal
          ),
          button: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      onGenerateRoute: (RouteSettings settings) {
        final dynamic arguments = settings.arguments;
        switch (settings.name) {
          case "/":
            return session["token"] != null ? PageTransition(child: const Dashboard(), type: PageTransitionType.fade) : PageTransition(child: const LoginPage(), type: PageTransitionType.fade);
            break;
          case Dashboard.routeName:
            return PageTransition(child: const Dashboard(), type: PageTransitionType.fade);
            break;
          case Users.routeName:
            return PageTransition(child: const Users(), type: PageTransitionType.fade);
            break;
          case Posts.routeName:
            return PageTransition(child: const Posts(), type: PageTransitionType.fade);
            break;
          case Directs.routeName:
            return PageTransition(child: const Directs(), type: PageTransitionType.fade);
            break;
          case AddUser.routeName:
            User? user;
            if(arguments is User){
              user = arguments;
            }
            return PageTransition(child: AddUser(user: user,), type: PageTransitionType.fade);
            break;
          case PostAdd.routeName:
            Post? post;
            if(arguments is Post){
              post = arguments;
            }
            return PageTransition(child: PostAdd(post: post,), type: PageTransitionType.fade);
            break;
          case DirectSettings.routeName:
            Direct? direct;
            if(arguments is Direct){
              direct = arguments;
            }
            return PageTransition(child: DirectSettings(direct: direct,), type: PageTransitionType.fade);
            break;
          case DirectAdd.routeName:
            Direct? direct;
            if(arguments is Direct){
              direct = arguments;
            }
            return PageTransition(child: DirectAdd(direct: direct,), type: PageTransitionType.fade);
            break;
          case "Disconnect":
            return PageTransition(child: const Directs(), type: PageTransitionType.fade);
            break;
          default:
            return MaterialPageRoute(builder: (BuildContext context) => const Page404());
            break;
        }
      },
    );
  }
}
