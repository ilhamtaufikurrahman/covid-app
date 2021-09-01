import 'package:covid_app/global_resources.dart';

class TotalServices {
  static String url = 'https://data.covid19.go.id/public/api/update.json';
  static Future<Total> getTotal() async {
    Response res = await get(Uri.parse(url));

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body)['update']['total'];

      return Total.addTotal(body);
    } else {
      throw 'Gagal mengambil data';
    }
  }
}
