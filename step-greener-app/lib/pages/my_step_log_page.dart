import 'package:step_greener/widgets/page_template.dart';
// import 'package:flutter/material.dart';
// import 'package:step_greener/widgets/page_template.dart';

// // TODO: Implement
// class MyStepLogPage extends StatefulWidget {
//   static const PageType pageType = PageType.myStepLog;
//   const MyStepLogPage({super.key});

//   @override
//   State<MyStepLogPage> createState() => _MyStepLogPageState();
// }

// class _MyStepLogPageState extends State<MyStepLogPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text( "My Step Log" ),);
//   }
// }
import 'package:flutter/material.dart';
import 'package:step_greener/widgets/step_display.dart'; // Import the new file
import 'package:intl/intl.dart'; // For formatting dates
import 'package:step_greener/theme/app_colors.dart';

class MyStepLogPage extends StatefulWidget {
  static const PageType pageType = PageType.myStepLog;

  const MyStepLogPage({super.key});
  @override
  _MyStepLogPageState createState() => _MyStepLogPageState();
}

class _MyStepLogPageState extends State<MyStepLogPage> {
  DateTime _selectedDate = DateTime.now(); // Stores current month & year
  final List<int> _years = List.generate(10, (index) => DateTime.now().year - 5 + index); // Years range

  void _changeMonth(int step) {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + step, 1);
    });
  }

  void _changeYear(int year) {
    setState(() {
      _selectedDate = DateTime(year, _selectedDate.month, 1);
    });
  }

  int _getDaysInMonth() {
    return DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day;
  }

  void _navigateToStepDisplay(BuildContext context, int day) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime(_selectedDate.year, _selectedDate.month, day));
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StepDisplay(selectedDate: formattedDate),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int totalDays = _getDaysInMonth();
    List<String> weekDays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Month & Year Selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_left),
                  onPressed: () => _changeMonth(-1),
                ),
                Text(
                  DateFormat('MMMM yyyy').format(_selectedDate),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_right),
                  onPressed: () => _changeMonth(1),
                ),
              ],
            ),

            // Year Dropdown
            DropdownButton<int>(
              value: _selectedDate.year,
              onChanged: (year) => _changeYear(year!),
              items: _years.map((year) {
                return DropdownMenuItem(
                  value: year,
                  child: Text(year.toString()),
                );
              }).toList(),
            ),

            SizedBox(height: 8),

            // Table Header (Days of the Week)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: weekDays
                  .map((day) => Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            day,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(height: 8),

            // Table Body
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7, // 7 columns for 7 days
                  childAspectRatio: 1.3,
                ),
                itemCount: totalDays,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _navigateToStepDisplay(context, index + 1),
                    child: Card(
                      color: AppColors.secondaryBackground,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 2,
                      child: Center(
                        child: Text(
                          "${index + 1}", // Display numbers from 1 to total days in month
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
