import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'userdata.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<PieChartSectionData> contestChartData = [];
  List<Streak> streaks = [];

  @override
  initState(){
    super.initState();
    setupContestData();
    setupStreakData();
  }
  
  setupContestData(){
    userData.contests.forEach((key, value) {
      contestChartData.add(
        PieChartSectionData(
          title: key,
          value: value.toDouble()
        )
      );
    });
  }

  setupStreakData(){
    userData.streak.forEach((key, value) {
      streaks.add(
        Streak()
        ..date = key
        ..y = value.toDouble()
      );
    });
    streaks.sort((a, b) => a.date.compareTo(b.date));
    for (int i = 0; i < streaks.length; i++) streaks[i].x = i;
  }

  String getTitle(double val){
    return DateFormat('E').format(DateTime.parse(streaks[val.toInt()].date));
  }

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
                  value: userData.percentageCorrect, title: 'Correct', color: Colors.green[800]),
              PieChartSectionData(
                value: 100.0 - userData.percentageCorrect,
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: BarChart(
              BarChartData(
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTitles: getTitle,
                  )
                ),
                barGroups: streaks.map((e) => e.data()).toList()
              )
            ),
          ),
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
            PieChartData(sections: contestChartData),
          ),
        ),
      ],
    );
  }
}


class Streak{
  String date = '';
  int x = 0;
  double y = 0;

  BarChartGroupData data(){
    return BarChartGroupData(x: x, barRods: [BarChartRodData(y: y)]);
  }
}