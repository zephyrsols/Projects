import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicksByMe extends StatefulWidget {
  const DatePicksByMe({Key? key}) : super(key: key);

  @override
  State<DatePicksByMe> createState() => _DatePicksByMeState();
}

class _DatePicksByMeState extends State<DatePicksByMe> {
  DateTime? _selectedDate;

  TextEditingController? _dateController = TextEditingController();

  void _presentDatePicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1980),
            lastDate: DateTime.now())
        .then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      setState(() {
        // using state so that the UI will be rerendered when date is picked
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.black),
                  hintText: 'Select DOB', icon: Icon(Icons.date_range)),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  helpText: 'Select Date of Birth',
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1980),
                    lastDate: DateTime.now(),
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        colorScheme: ColorScheme.fromSwatch(
                          primarySwatch: Colors.teal,
                          accentColor: Colors.teal,
                        ),
                        dialogBackgroundColor:Colors.white,
                      ),
                      child: child!,
                    );
                  },
                );

                // Check if no date is selected
                if (pickedDate != null) {
                  setState(() {
                    // using state so that the UI will be rerendered when date is picked
                    _dateController?.text =
                        DateFormat('dd-MMM-yyyy').format(pickedDate);
                  });
                }
                setState(() {
                  // using state so that the UI will be rerendered when date is picked
                  _selectedDate = pickedDate;
                });
              },
            ),
            ElevatedButton(
                onPressed: () {
                  if (kDebugMode) {
                    print(DateFormat('dd-MMM-yyyy').format(_selectedDate!));
                  }
                },
                child: Text('Submit'))
          ],
        ),
      ),

      // display the selected date
    );
  }
}
