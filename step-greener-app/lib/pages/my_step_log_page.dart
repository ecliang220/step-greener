import 'package:flutter/material.dart';
import 'package:step_greener/widgets/step_display.dart'; // Import StepDisplay
import 'package:intl/intl.dart'; // For formatting dates
import 'package:step_greener/theme/app_colors.dart';
import 'package:step_greener/widgets/page_template.dart';

class MyStepLogPage extends StatefulWidget {
  static const PageType pageType = PageType.myStepLog;
  const MyStepLogPage({super.key});

  @override
  StepLogPageState createState() => StepLogPageState();
}

class StepLogPageState extends State<MyStepLogPage> {
  DateTime _selectedDate = DateTime.now(); // Stores current month & year
  int? _selectedDay; // Stores selected day for StepDisplay
  final List<int> _years = List.generate(10, (index) => DateTime.now().year - 5 + index); // Years range

  void _changeMonth(int step) {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + step, 1);
      _selectedDay = null; // Reset selected day when changing month
    });
  }

  void _changeYear(int year) {
    setState(() {
      _selectedDate = DateTime(year, _selectedDate.month, 1);
      _selectedDay = null; // Reset selected day when changing year
    });
  }

  int _getDaysInMonth() {
    return DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day;
  }

  void _selectDay(int day) {
    setState(() {
      _selectedDay = day; // Update selected day
    });
  }

  @override
  Widget build(BuildContext context) {

    int totalDays = _getDaysInMonth();
    List<String> weekDays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    String formattedDate = _selectedDay != null
        ? DateFormat('yyyy-MM-dd').format(DateTime(_selectedDate.year, _selectedDate.month, _selectedDay!))
        : "Select a day";

    return Scaffold(
      backgroundColor: AppColors.secondaryBackground,
      body: Column(
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
            children: weekDays.map((day) => Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(8.0),
                child: Text(day, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            )).toList(),
          ),
          SizedBox(height: 8),

          // Calendar Grid
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7, // 7 columns for 7 days
                childAspectRatio: 1.3,
              ),
              itemCount: totalDays,
              itemBuilder: (context, index) {
                int day = index + 1;
                bool isSelected = _selectedDay == day;

                return GestureDetector(
                  onTap: () => _selectDay(day),
                  child: Card(
                    color: isSelected ? AppColors.textButtonColor : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: isSelected ? 4 : 2,
                    child: Center(
                      child: Text(
                        "$day",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Step Display at Bottom
          if (_selectedDay != null)
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.0),
              child: StepDisplay(selectedDate: formattedDate),
            ),
        ],
      ),
    );
  }
}
