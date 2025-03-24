import 'dart:ui';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watchlist/screens/watchlist_page.dart';

import 'home_page.dart';

class ChartScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChartScreen> {
  double investmentAmount = 1.0; // Default investment amount in Lakh

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Motilal Oswal Midcap Direct Growth", style: TextStyle(color: Colors.white, fontSize: 16)),
        leading: Icon(Icons.arrow_back, color: Colors.white),
        actions: [Icon(Icons.share, color: Colors.white)],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInvestmentSummary(),
            SizedBox(height: 16),
            _buildLineChart(),
            SizedBox(height: 16),
            _buildInvestmentCalculator(),
            SizedBox(height: 16),
            _buildBarChart(),
            SizedBox(height: 16),
            _buildActionButtons(),
          ],
        ),
      ),




        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          currentIndex: 1, // Watchlist tab is selected
          onTap: (index) {

            if (index == 0) {
              // Navigate to Home Screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            } else if (index == 2) {
              // Navigate to Watchlist Screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => WatchlistScreen()),
              );
            }


          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: "Charts",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: "Watchlist",
            ),
          ],
        )
    );
  }

BarChartGroupData makeBar(int x, double y) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(toY: y, color: Colors.green, width: 20),
    ],
  );
}


  Widget _infoColumn(String title, String value, {Color color = Colors.white}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.white70, fontSize: 14.sp)),
        Text(value, style: TextStyle(color: color, fontSize: 16.sp, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _returnBox(String title, String value) {
    return Column(
      children: [
        Text(title, style: TextStyle(color: Colors.white70, fontSize: 14.sp)),
        SizedBox(height: 5.h),
        Text(value, style: TextStyle(color: Colors.green, fontSize: 16.sp, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

Widget investmentColumn(String title, String value, {bool isLoss = false}) {
  return Column(
    children: [
      Text(title, style: TextStyle(color: Colors.white54)),
      SizedBox(height: 4),
      Text(value, style: TextStyle(color: isLoss ? Colors.red : Colors.white)),
    ],
  );
}

LineChartData sampleData() {
  return LineChartData(
    lineBarsData: [
      LineChartBarData(
        spots: [
          FlSpot(0, 1),
          FlSpot(1, 2),
          FlSpot(2, 1.5),
          FlSpot(3, 2.8),
          FlSpot(4, 2.5),
          FlSpot(5, 3),
        ],
        isCurved: true,
        gradient: LinearGradient(colors: [Colors.blue, Colors.blueAccent]), // ✅ Fix
        barWidth: 3,
      ),
      LineChartBarData(
        spots: [
          FlSpot(0, 0.5),
          FlSpot(1, 1.8),
          FlSpot(2, 1.2),
          FlSpot(3, 2.2),
          FlSpot(4, 2),
          FlSpot(5, 2.5),
        ],
        isCurved: true,
        gradient: LinearGradient(colors: [Colors.orange, Colors.deepOrange]), // ✅ Fix
        barWidth: 3,
      ),
    ],
  );
}

Widget _buildInvestmentSummary() {
  return Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.grey[900],
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _summaryColumn("Invested", "₹1.5k"),
        _summaryColumn("Current Value", "₹1.28k"),
        _summaryColumn("Total Gain", "₹ -220.16", isNegative: true),
      ],
    ),
  );
}

Widget _summaryColumn(String title, String value, {bool isNegative = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: TextStyle(color: Colors.white54, fontSize: 12)),
      SizedBox(height: 4),
      Text(value, style: TextStyle(color: isNegative ? Colors.red : Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
    ],
  );
}

/// Line Chart
Widget _buildLineChart() {
  return Container(
    height: 200,
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(8)),
    child: LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: [FlSpot(0, 1), FlSpot(1, 2), FlSpot(2, 1.5), FlSpot(3, 2.8), FlSpot(4, 2.5), FlSpot(5, 3)],
            isCurved: true,
            barWidth: 3,
            gradient: LinearGradient(colors: [Colors.blue, Colors.lightBlue]),
          ),
          LineChartBarData(
            spots: [FlSpot(0, 0.5), FlSpot(1, 1.8), FlSpot(2, 1.2), FlSpot(3, 2.2), FlSpot(4, 2), FlSpot(5, 2.5)],
            isCurved: true,
            barWidth: 3,
            gradient: LinearGradient(colors: [Colors.orange, Colors.deepOrange]),
          ),
        ],
      ),
    ),
  );
}

/// Investment Calculator with Slider
Widget _buildInvestmentCalculator() {
  double investmentAmount = 1.0;
  return StatefulBuilder(
    builder: (context, setState) {
      return Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("If you invested ₹${investmentAmount.toInt()}L", style: TextStyle(color: Colors.white, fontSize: 14)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("₹1L", style: TextStyle(color: Colors.white54, fontSize: 12)),
                Text("₹10L", style: TextStyle(color: Colors.white54, fontSize: 12)),
              ],
            ),
            Slider(
              min: 1,
              max: 10,
              value: investmentAmount,
              activeColor: Colors.blue,
              inactiveColor: Colors.grey,
              onChanged: (value) {
                setState(() {
                  investmentAmount = value;
                });
              },
            ),
          ],
        ),
      );
    },
  );
}

/// Bar Chart
Widget _buildBarChart() {
  return Container(
    height: 180,
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(8)),
    child: BarChart(
      BarChartData(
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(show: false),
        barGroups: [
          _barData(0, 1.19, Colors.green),
          _barData(1, 3.61, Colors.greenAccent),
          _barData(2, 4.55, Colors.lightGreen),
        ],
      ),
    ),
  );
}

BarChartGroupData _barData(int x, double y, Color color) {
  return BarChartGroupData(
    x: x,
    barRods: [BarChartRodData(toY: y, color: color, width: 16)],
  );
}

/// Action Buttons
Widget _buildActionButtons() {
  return Row(
    children: [
      Expanded(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(vertical: 12),
          ),
          onPressed: () {},
          child: Text("Sell", style: TextStyle(fontSize: 16, color: Colors.white)),
        ),
      ),
      SizedBox(width: 12),
      Expanded(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(vertical: 12),
          ),
          onPressed: () {},
          child: Text("Invest More", style: TextStyle(fontSize: 16, color: Colors.white)),
        ),
      ),
    ],
  );
}


