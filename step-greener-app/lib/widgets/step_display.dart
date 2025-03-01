import 'dart:io';
import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
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
  int? _steps;
  int? _points;

  Future<void> _loadCSV() async {
    try {
    // Load CSV file from assets
      final input = await rootBundle.loadString('assets/csv/example.csv');
      final fields = const CsvToListConverter().convert(input);

      setState(() {
      _csvData = fields;
      _updateSelectedDateData(); // Update UI with selected date’s data
      });
    } catch (e) {
      print("Error loading CSV: $e");
    }
  }

  void _updateSelectedDateData() {
    final row = _csvData.firstWhere(
      (row) => row[0].toString() == widget.selectedDate,
      orElse: () => [],
    );

    if (row.isNotEmpty) {
      setState(() {
        _steps = row[1];
        _points = row[2];
      });
    } else {
      setState(() {
        _steps = null;
        _points = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _loadCSV,
              child: Text("Load CSV"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              color: Colors.lightBlue[50],
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.textButtonColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        widget.selectedDate,
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text("Steps: ${_steps ?? 'N/A'}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text("Points Earned: ${_points ?? 'N/A'}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
