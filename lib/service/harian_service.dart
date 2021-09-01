import 'package:covid_app/global_resources.dart';

class HarianService {
  static String url = 'https://data.covid19.go.id/public/api/update.json';

  static Future<List<Harian>> getHarian() async {
    Response res = await get(Uri.parse(url));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body)['update']['harian'];
      List<Harian> harian = body.map((item) => Harian.addHarian(item)).toList();

      return harian;
    } else {
      throw 'gagal mengambil data';
    }
  }
}
