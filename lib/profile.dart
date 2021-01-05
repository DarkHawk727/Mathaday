import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'userdata.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: CircleAvatar(
                backgroundColor: Colors.red[800],
                radius: 75.0,
              ),
            ),
            Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Name:',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Grade:',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Level:',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ]),
          ],
        ),
        Divider(
          color: Colors.white,
          thickness: 2.5,
        ),
        Center(
          child: Text(
            'Grades',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PieChart(
            PieChartData(sections: [
              PieChartSectionData(
                  value: 70.0, title: 'Correct', color: Colors.green[800]),
              PieChartSectionData(
                value: 30.0,
                title: "Incorrect",
              )
            ]),
          ),
        ),
        Center(
          child: Text(
            'Streaks',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        Center(
          child: BarChart(BarChartData(barGroups: [
            BarChartGroupData(x: 10, barRods: [BarChartRodData(y: 10)])
          ])),
        ),
        Center(
          child: Text(
            'Most Popular Contests',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PieChart(
            PieChartData(sections: [
              PieChartSectionData(
                  value: 70.0, title: 'Fermat', color: Colors.green[800]),
              PieChartSectionData(value: 30.0, title: 'CSMC')
            ]),
          ),
        ),
      ],
    );
  }
}
