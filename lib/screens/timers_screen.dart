import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timerlist/screens/widgets/timer_widget.dart';
import '../models/model.dart';
import 'add_timer_screen.dart';

class TimersScreen extends StatefulWidget {
  const TimersScreen({Key? key}) : super(key: key);

  @override
  State<TimersScreen> createState() => TimersScreenState();
}

class TimersScreenState extends State<TimersScreen> {
  final listController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TimersModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('TIMER LIST'),
      ),
      body: model.times.isNotEmpty
          ? ListView.builder(
              controller: listController,
              padding: const EdgeInsets.only(top: 5),
              itemCount: model.times.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Timer №${model.getTimer(index).timerNumber}',
                            style: const TextStyle(fontSize: 17),
                          ),
                          const SizedBox(width: 30),
                          (model.times.length > 4)
                              ? (index == 0)
                                  ? TimerWidget(
                                      seconds: model.getTimer(0).time,
                                      index: 0,
                                      model: model,
                                    )
                                  : (index == 1)
                                      ? TimerWidget(
                                          seconds: model.getTimer(1).time,
                                          index: 1,
                                          model: model,
                                        )
                                      : (index == 2)
                                          ? TimerWidget(
                                              seconds: model.getTimer(2).time,
                                              index: 2,
                                              model: model,
                                            )
                                          : (index == 3)
                                              ? TimerWidget(
                                                  seconds:
                                                      model.getTimer(3).time,
                                                  index: 3,
                                                  model: model,
                                                )
                                              : const Text('Paused')
                              : (index == 0)
                                  ? TimerWidget(
                                      seconds: model.getTimer(0).time,
                                      index: 0,
                                      model: model,
                                    )
                                  : const Text('Paused'),
                        ],
                      ),
                      const Divider(
                        color: Color.fromARGB(255, 28, 0, 77),
                        height: 30,
                        thickness: 2,
                      )
                    ],
                  ),
                );
              },
            )
          : Container(),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.deepPurple)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: ${model.times.length}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              FloatingActionButton(
                child: const Icon(
                  Icons.add,
                  size: 35,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AddTimerScreen(model: model);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
