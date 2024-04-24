class TimerState {
  final int timeLeft;

  const TimerState({required this.timeLeft});

  int get remainingMinutes => timeLeft ~/ 60;
  int get remainingSeconds => timeLeft % 60;
}