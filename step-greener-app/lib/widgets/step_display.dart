import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:step_greener/theme/app_colors.dart';
import 'package:flutter/services.dart' show rootBundle;

class StepDisplay extends StatefulWidget {
  final String selectedDate;

  StepDisplay({required this.selectedDate});

  @override
  StepDisplayState createState() => StepDisplayState();
}

class StepDisplayState extends State<StepDisplay> {
  List<List<dynamic>> _csvData = [];
  int _steps = 0;
  int _points = 0;
  bool _isLoading = true;
  bool _hasError = false;
  late String _currentDate; // ✅ Track current selected date

  @override
  void initState() {
    super.initState();
    _currentDate = widget.selectedDate; // ✅ Initialize with first date
    _loadCSV();
  }

  @override
  void didUpdateWidget(StepDisplay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedDate != _currentDate) { // ✅ Detect when date changes
      setState(() {
        _currentDate = widget.selectedDate;
        _isLoading = true; // ✅ Show loading indicator for new selection
      });
      _updateSelectedDateData();
    }
  }

  Future<void> _loadCSV() async {
    try {
      final input = await rootBundle.loadString('assets/csv/example.csv');
      final fields = const CsvToListConverter().convert(input);

      setState(() {
        _csvData = fields;
        _updateSelectedDateData();
        _isLoading = false;
      });
    } catch (e) {
      print("Error loading CSV: $e");
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
    }
  }

  void _updateSelectedDateData() {
    final row = _csvData.firstWhere(
      (row) => row.isNotEmpty && row[0].toString() == _currentDate,
      orElse: () => [],
    );

    if (row.isNotEmpty && row.length >= 3) {
      setState(() {
        _steps = row[1] is int ? row[1] : int.tryParse(row[1].toString()) ?? 0;
        _points = row[2] is int ? row[2] : int.tryParse(row[2].toString()) ?? 0;
        _isLoading = false; // ✅ Stop loading once data is updated
      });
    } else {
      setState(() {
        _steps = 0;
        _points = 0;
        _isLoading = false; // ✅ Stop loading even if no data is found
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // ✅ Makes StepDisplay full width
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)], // ✅ Adds shadow
      ),
      child: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _hasError
              ? Center(child: Text("Failed to load data.", style: TextStyle(color: Colors.red)))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center, // ✅ Center content
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: double.infinity, // ✅ Ensure full width
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.textButtonColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _currentDate,
                        textAlign: TextAlign.center, // ✅ Center-align date text
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text("Steps: $_steps",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text("Points Earned: $_points",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
    );
  }
}
