import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:food_app/module/network_communication/bloc/connectivity_bloc/check_connectivity_bloc.dart';

class NetworkHelper{

  static void networkObserver(){
    Connectivity().onConnectivityChanged.listen((result) {
      if(result == ConnectivityResult.none){
         CheckConnectivityBloc().add(NetworkObserverEvent());
      } else {
        CheckConnectivityBloc().add(NetworkNotifyEvent( connectivity: true));
      }
    });
  }
}