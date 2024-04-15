part of 'connictivity_bloc.dart';

@immutable
sealed class ConnictivityEvent {}

class ConnectedEvent extends ConnictivityEvent{}

class NotConnectedEvent extends ConnictivityEvent{}


