import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/utils/app_style.dart';
import 'package:online_exam_app/features/exam_for_student/presentaion/views/widgets/exam_screen_body.dart';
import '../../../../core/utils/app_router.dart';
import '../../../authintication/data/models/student_details_model.dart';
import '../manger/timer_cubit/exam_time_cubit.dart';
import '../manger/timer_cubit/exam_time_state.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key, required this.studentDetailsModel, required this.examTime});
  final StudentDetailsModel studentDetailsModel;
  final int examTime;
  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  late final TimerCubit _timerCubit;

  @override
  void initState() {
    super.initState();
    _timerCubit = TimerCubit(widget.examTime);
    _timerCubit.startTimer();
  }

  @override
  void dispose() {
    _timerCubit.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TimerCubit>(create: (context) => _timerCubit),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: BlocConsumer<TimerCubit, TimerState>(
            listener: (context, state) {
              if (state.timeLeft == 0) {
                GoRouter.of(context).push(AppRouter.kCreateExamPage);
              }
            },
            builder: (context, state) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.studentDetailsModel.examDetails.examName,
                    style: AppStyles.styleSemiBold24(context),
                  ),
                  Text('${state.remainingMinutes}m ${state.remainingSeconds}s'),
                ],
              ),
            ),
          ),
        ),
        body:ExamScreenBody(
          studentDetailsModel: widget.studentDetailsModel,
        ),
      ),
    );
  }
}
