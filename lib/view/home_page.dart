import 'package:covid_app/global_resources.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(children: [
        FutureBuilder(
          future: TotalServices.getTotal(),
          builder: (BuildContext context, AsyncSnapshot<Total> snapshot) {
            if (snapshot.hasData) {
              Total total = snapshot.data!;
              return SfCircularChart(
                title: ChartTitle(text: 'Data Positif Covid'),
                legend: Legend(isVisible: true),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <CircularSeries>[
                  PieSeries<ChartData, String>(
                      dataSource: [
                        ChartData('Dirawat', total.jumlahDirawat),
                        ChartData('Meninggal', total.jumlahMeninggal),
                        ChartData('Sembuh', total.jumlahSembuh)
                      ],
                      pointColorMapper: (ChartData data, _) => data.color,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      explode: true,
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                      enableTooltip: true)
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        FutureBuilder(
          future: HarianService.getHarian(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Harian>> snapshot) {
            if (snapshot.hasData) {
              List<Harian> harian = snapshot.data!;
              return RotatedBox(
                quarterTurns: 1,
                child: SfCartesianChart(
                  zoomPanBehavior: ZoomPanBehavior(
                      enablePinching: true,
                      zoomMode: ZoomMode.x,
                      enablePanning: true),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  primaryXAxis: DateTimeAxis(),
                  primaryYAxis: NumericAxis(opposedPosition: true),
                  legend: Legend(isVisible: true),
                  series: <ChartSeries>[
                    LineSeries<Harian, DateTime>(
                      legendItemText: 'Positif',
                      dataSource: harian,
                      xValueMapper: (Harian data, _) =>
                          DateTime.parse(data.keyAsString.toString()),
                      yValueMapper: (Harian data, _) => data.jumlahPositif,
                      enableTooltip: true,
                    ),
                    LineSeries<Harian, DateTime>(
                      legendItemText: 'Sembuh',
                      dataSource: harian,
                      xValueMapper: (Harian data, _) =>
                          DateTime.parse(data.keyAsString.toString()),
                      yValueMapper: (Harian data, _) => data.jumlahSembuh,
                      enableTooltip: true,
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        FutureBuilder(
          future: TotalServices.getTotal(),
          builder: (BuildContext context, AsyncSnapshot<Total> snapshot) {
            if (snapshot.hasData) {
              Total total = snapshot.data!;
              return SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                series: <ChartSeries>[
                  BarSeries<ChartData, String>(
                      dataSource: [
                        ChartData("Positif", total.jumlahPositif, xx: 1),
                        ChartData("Dirawat", total.jumlahDirawat, xx: 2),
                        ChartData("Sembuh", total.jumlahSembuh, xx: 3),
                        ChartData("Meninggal", total.jumlahMeninggal, xx: 4),
                      ],
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y)
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        )
      ]),
    );
  }
}
