import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService extends GetxService {
  var isConnected = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initConnectivity();
  }

  Future<void> _initConnectivity() async {
      List<ConnectivityResult> result = await Connectivity().checkConnectivity();
      _updateConnectionStatus(result);
      
      Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) { 
           _updateConnectionStatus(result);
      });
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    if (result[0] == ConnectivityResult.mobile || result[0] == ConnectivityResult.wifi) {
      isConnected.value = true;
    } else {
      isConnected.value = false;
    }
  }
}
