import 'package:flutter/material.dart';
import 'package:myapp/utils/helper/helper_functions.dart';
import 'package:myapp/view/my_spendings_page/Widgets/listing_element.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MySpendings extends StatelessWidget {
  const MySpendings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Spendings'),
          automaticallyImplyLeading: true,
          actions: const [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(Icons.menu),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                color: Colors.white,
                child: Expanded(
                  child: SfCartesianChart(
                    primaryXAxis: const CategoryAxis(),
                    primaryYAxis: const NumericAxis(),
                    series: [
                      SplineSeries<SpendingsData, String>(
                          dataLabelSettings: const DataLabelSettings(
                            isVisible: true,
                          ),
                          dataSource: getSpendings(),
                          xValueMapper: (SpendingsData spendings, _) =>
                              spendings.x,
                          yValueMapper: (SpendingsData spendings, _) =>
                              spendings.y)
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24)),
                    color: Color(0xFF2F2762)),
                height: MediaQuery.of(context).size.height * 0.7,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(30),
                      height: 120,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Budget for October",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              Text(
                                "\$${putCommaInNumber("2460")}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          LinearPercentIndicator(
                            padding: EdgeInsets.zero,
                            barRadius: const Radius.circular(12),
                            lineHeight: 8.0,
                            percent: 0.9,
                            progressColor: Colors.green,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 21, vertical: 21),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24)),
                          color: Color(0xFFF4F6F6)),
                      child: Column(
                        children: [
                          listingElevent(context),
                          const SizedBox(height: 15),
                          listingElevent(context),
                          const SizedBox(height: 15),
                          listingElevent(context),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class SpendingsData {
  String x;
  double y;
  SpendingsData(this.x, this.y);
}

List<SpendingsData> getSpendings() {
  List<SpendingsData> spendings = [
    SpendingsData("Rent", 50),
    SpendingsData("Groceries", 100),
    SpendingsData("Transport", 140),
    SpendingsData("Entertainment", 200),
    SpendingsData("Others", 275),
  ];
  return spendings;
}
