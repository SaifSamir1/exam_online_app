import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';


part 'connictivity_event.dart';
part 'connictivity_state.dart';

class ConnictivityBloc extends Bloc<ConnictivityEvent, ConnictivityState> {
  StreamSubscription? _subscription;
  ConnictivityBloc() : super(ConnictivityInitial()) {
    on<ConnictivityEvent>((event, emit) {
      if (event is ConnectedEvent)
        {
          emit(ConnectedState(message: 'Connected'));
        }
      if(event is NotConnectedEvent){

        emit(NotConnectedState(message: 'Not Connected'));
      }
    });
    _subscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
      if(result[0] == ConnectivityResult.wifi || result[0] == ConnectivityResult.mobile ){
        add(ConnectedEvent());
      }else {
        add(NotConnectedEvent());
      }
    });
  }
  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
