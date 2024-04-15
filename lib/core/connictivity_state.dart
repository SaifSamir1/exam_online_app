part of 'connictivity_bloc.dart';

@immutable
sealed class ConnictivityState {}

final class ConnictivityInitial extends ConnictivityState {}

final class ConnectedState extends ConnictivityState {
  final String message;

  ConnectedState({required this.message});
}
final class NotConnectedState extends ConnictivityState {
  final String message;

  NotConnectedState({required this.message});
}
