import 'package:expensetracker/pages/homescreen.dart';
import 'package:expensetracker/pages/settings.dart';
import 'package:expensetracker/widget/bottomnavigation.dart';
import 'package:flutter/material.dart';

class statistics extends StatefulWidget {
   statistics({super.key});

  @override
  State<statistics> createState() => _statisticsState();
}

class _statisticsState extends State<statistics> {
  int myIndex=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Statistics"),
          centerTitle: true,
        ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: myIndex,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });

          switch (index) {
            case 0:
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => homescreen(),
              ));
              break;
            case 1:
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => statistics(),
              ));
              break;
            case 2:
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => settings(),
              ));
              break;
          }
        },
      ),
    );
  }
}
