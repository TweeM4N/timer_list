import 'dart:async';
import 'package:flutter/material.dart';
import '../../models/model.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({
    Key? key,
    required this.seconds,
    required this.index,
    required this.model,
  }) : super(key: key);
  final int seconds;
  final int index;
  final TimersModel model;

  @override
  State<TimerWidget> createState() => TimerWidgetState();
}

class TimerWidgetState extends State<TimerWidget> {
  Timer? timer;
  late int time;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    final seconds = widget.seconds;
    time = seconds;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (time > 0) {
        setState(() => time--);
        widget.model.changeSeconds(widget.index, time);
      } else {
        if (widget.model.times.length == 1) {
          widget.model.clearAll();
        } else {
          widget.model.remove(widget.index);
        }
        if (widget.model.times.isNotEmpty) {
          setState(() => time = widget.model.times[widget.index].time);
        } else {
          timer.cancel();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(time.toString(), style: const TextStyle(fontSize: 18));
  }
}
