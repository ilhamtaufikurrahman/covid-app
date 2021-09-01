import 'package:covid_app/global_resources.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<ChartData> chartData = [
    //   ChartData('Dirawat', 10),
    //   ChartData('Meninggal', 15),
    //   ChartData('Sembuh', 20)
    // ];
    return Scaffold(
      body: FutureBuilder(
        future: TotalServices.getTotal(),
        builder: (BuildContext context, AsyncSnapshot<Total> snapshot) {
          if (snapshot.hasData) {
            Total total = snapshot.data!;
            return Center(
                child: SfCircularChart(
              series: <CircularSeries>[
                PieSeries<ChartData, String>(
                    dataSource: [
                      ChartData('Dirawat', total.jumlahDirawat),
                      ChartData('Meninggal', total.jumlahMeninggal),
                      ChartData('Sembuh', total.jumlahSembuh)
                    ],
                    pointColorMapper: (ChartData data, _) => data.color,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y)
              ],
            ));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
