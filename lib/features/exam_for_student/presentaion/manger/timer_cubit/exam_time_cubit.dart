import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'exam_time_state.dart';


class TimerCubit extends Cubit<TimerState> {
  TimerCubit(int initialTimeInMinutes)
      : super(TimerState(timeLeft: initialTimeInMinutes * 60)); // Convert mins to seconds

  late final Timer _timer; // Declare the timer instance

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) => _onTick());
  }
  void _onTick() {
    if (state.timeLeft > 0) {
      emit(TimerState(timeLeft: state.timeLeft - 1));
    } else {
      _timer.cancel();
      emit(const TimerState(timeLeft: 0));
      navigateToGradeScreen(); // Call navigation function here
    }
  }


  void navigateToGradeScreen() {
    log('Grade screen');
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}