import 'package:covid_app/global_resources.dart';

class CovidApp extends StatelessWidget {
  const CovidApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      onGenerateRoute: Routes().onGenerateRoute,
    );
  }
}
