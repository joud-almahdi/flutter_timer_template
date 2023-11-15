import 'dart:async';
import 'package:get/state_manager.dart';

class TimerController extends GetxController {
  Timer? countdownTimer;
  bool enableButton = true;
  bool isTimeOver = false
  
  
  ;
  Duration myduration = const Duration(minutes: 1);

  startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (timer) => setCountDown());
    update();
  }

  String strDigits(int n) => n.toString().padLeft(2, '0');

  var hours = " ".obs;
  var minutes = " ".obs;
  var seconds = " ".obs;

  setCountDown() {
    const reduceBy = 1;
    final seconds = myduration.inSeconds - reduceBy;
    if (seconds < 0) {
      countdownTimer!.cancel();
      enableButton = true;
      isTimeOver = true;
      myduration = const Duration(minutes: 1);
      
    } else {
      myduration = Duration(seconds: seconds);
        enableButton = false;
      isTimeOver = false;
    }
    update();
  }

  var intTimer1 = 5.obs;
  // var intTimer2 = 0;
  // var intTimer3 = 0;
  // var intTimer4 = 0;
  // var timer = "Press the button to start the timer".obs;

  //var hours = 01;
  //var mints = 10;
  //var secs = 00;
  //var countdownDuration1 = Duration(hours: 1);

  // changeText() {
  //   Timer.periodic(Duration(seconds: 1), (timer) {
  //     if (intTimer1 > 0) {
  //       enablebutton = false;
  //       intTimer1--;
  //     } else {
  //       enablebutton = true;
  //       timer.cancel();
  //     }
  //   });
  //   update();
  // }
}
