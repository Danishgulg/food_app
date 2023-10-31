part of 'check_connectivity_bloc.dart';

@immutable
abstract class CheckConnectivityEvent {}

class NetworkObserverEvent extends CheckConnectivityEvent {}

class NetworkNotifyEvent extends CheckConnectivityEvent {
  final bool connectivity;

  NetworkNotifyEvent({this.connectivity = false});
}
