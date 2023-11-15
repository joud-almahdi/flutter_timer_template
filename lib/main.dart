import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timertemplate/controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = Get.put(TimerController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TimerController>(builder: (controller) {
      controller.hours.value =
          controller.strDigits(controller.myduration.inHours.remainder(24));
      controller.minutes.value =
          controller.strDigits(controller.myduration.inMinutes.remainder(60));
      controller.seconds.value =
          controller.strDigits(controller.myduration.inSeconds.remainder(60));
      return Scaffold(

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: controller.enableButton && !controller.isTimeOver || controller.enableButton && controller.isTimeOver
                      ? () {
                          controller.enableButton = false;
                          controller.isTimeOver = false;
                          controller.startTimer();
                        }
                      : null,
                  child: Text('Start Timer')),
              SizedBox(
                height: 12,
              ),
              Text(controller.enableButton && !controller.isTimeOver 
                  ? "Press the button to start the timer"
                  : controller.enableButton && controller.isTimeOver
                      ? "Time's up"
                      : "${controller.hours.value.toString()}:${controller.minutes.value.toString()}:${controller.seconds.value.toString()}"),
            ],
          ),
        ),
      );
    });
  }
}
