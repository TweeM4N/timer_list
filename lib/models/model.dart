import 'package:flutter/material.dart';

class TimersModel with ChangeNotifier {
  List<TimerModel> times = [];

  TimerModel getTimer(index) {
    return times[index];
  }

  void add(timerNumber, time) {
    times.add(TimerModel(timerNumber: timerNumber, time: time));
    notifyListeners();
  }

  void remove(index) {
    times.removeAt(index);
    notifyListeners();
  }

  void clearAll() {
    times.clear();
    notifyListeners();
  }

  void changeSeconds(index) {
    int timerNumber = times[index].timerNumber;
    int time = times[index].time - 1;
    times.removeAt(index);
    times.insert(index, TimerModel(timerNumber: timerNumber, time: time));
    notifyListeners();
  }
}

class TimerModel {
  int timerNumber, time;
  TimerModel({required this.timerNumber, required this.time});
}
