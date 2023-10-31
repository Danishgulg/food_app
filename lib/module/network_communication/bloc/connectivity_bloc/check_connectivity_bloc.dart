import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/model/network_helper.dart';

part 'check_connectivity_event.dart';
part 'check_connectivity_state.dart';

class CheckConnectivityBloc
    extends Bloc<CheckConnectivityEvent, CheckConnectivityState> {

  CheckConnectivityBloc._() : super(ConnectivityInitialState()) {
    on<NetworkObserverEvent>(_observe);

    on<NetworkNotifyEvent>(_notifyStatus);
  }

  static final CheckConnectivityBloc _instance = CheckConnectivityBloc._();

  factory CheckConnectivityBloc() => _instance;

  void _observe(event, emit) {
    NetworkHelper.networkObserver();
  }

  void _notifyStatus(NetworkNotifyEvent event, emit) {
    event.connectivity
        ? emit(ConnectivityDisconnectedState())
        : emit(ConnectivityConnectedState());
  }
}
