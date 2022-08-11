import 'package:flutter/material.dart';
import '../models/model.dart';

class AddTimerScreen extends StatefulWidget {
  const AddTimerScreen({Key? key, required this.model}) : super(key: key);
  final TimersModel model;

  @override
  State<AddTimerScreen> createState() => _AddTimerScreenState();
}

int _timerNumber = 0;

class _AddTimerScreenState extends State<AddTimerScreen> {
  final controller = TextEditingController();

  void addTimer() {
    _timerNumber++;
    final time = int.parse(controller.text.trim());
    widget.model.add(_timerNumber, time);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: '0 seconds',
                    fillColor: Colors.grey[200],
                    filled: true),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.05),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.deepPurple,
              ),
              onPressed: addTimer,
              child: const Text('Set timer'),
            ),
          ],
        ),
      ),
    );
  }
}
