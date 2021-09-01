import 'package:covid_app/global_resources.dart';

const String home = '/home';

class Routes {
  Route<dynamic> onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case home:
        return MaterialPageRoute(builder: (context) => HomePage());
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                    child: Text('Hello WOrld'),
                  ),
                ));
    }
  }
}
