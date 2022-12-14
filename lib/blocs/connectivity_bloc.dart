import 'dart:async';
import 'package:connectivity/connectivity.dart';

class ConnectivityBloc {
  // late StreamController _connectivityConroller;
  // StreamSink get ConnectivityResultSink => _connectivityConroller.sink;
  // Stream get connectivityResultStream => _connectivityConroller.stream;

  late StreamController<ConnectivityResult> _connectivityController;
  StreamSink<ConnectivityResult> get connectivityResultSink =>
      _connectivityController.sink;
  Stream<ConnectivityResult> get connectivityResultStream =>
      _connectivityController.stream;

  ConnectivityBloc() {
    _connectivityController = StreamController<ConnectivityResult>.broadcast();
    checkCurrentConnectivity();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      _connectivityController.add(result);
    });
  }

  void checkCurrentConnectivity() async {
    ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    _connectivityController.add(connectivityResult);
  }

  dispose() {
    _connectivityController.close();
  }
}
