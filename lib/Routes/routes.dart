import 'package:flutter/material.dart';
import 'package:github_app/Screens/search_user.dart';

class Routes {
  static const userSearchRoute = '/usersearch';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/usersearch':
        return MaterialPageRoute(builder: (_) => UserSearch());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
