import 'package:flutter/material.dart';

class schedulepage extends StatefulWidget {
  const schedulepage({super.key});

  @override
  State<schedulepage> createState() => _schedulepageState();
}

class _schedulepageState extends State<schedulepage> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    ) as DateTime;

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff6774FF),
        title: const Text(
          "Schedule",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("No schedule of Today"),
            MaterialButton(
              onPressed: () {
                _selectDate(context);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xff6774FF),
                    borderRadius: BorderRadius.circular(10)),
                width: double.infinity,
                height: 52,
                child: const Center(
                  child: Text(
                    "Managed Timestable",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
