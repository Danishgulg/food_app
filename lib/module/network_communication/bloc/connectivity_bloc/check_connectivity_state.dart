part of 'check_connectivity_bloc.dart';

@immutable
abstract class CheckConnectivityState {}

class ConnectivityInitialState extends CheckConnectivityState {}
class ConnectivityConnectedState extends CheckConnectivityState {}
class ConnectivityDisconnectedState extends CheckConnectivityState {}


