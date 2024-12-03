import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class MapsController extends GetxController {
  var isLoading = true.obs;
  var position = Rxn<Position>();
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    updateLocation();
  }

  /// Update lokasi pengguna
  Future<void> updateLocation() async {
    isLoading.value = true;
    try {
      position.value = await _determinePosition();
      errorMessage.value = '';
    } catch (e) {
      errorMessage.value = e.toString();
      position.value = null;
    } finally {
      isLoading.value = false;
    }
  }

  /// Fungsi untuk menentukan lokasi pengguna
  Future<Position> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw 'Location services are disabled. Please enable them in your device settings.';
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw 'Location permissions are denied. Please grant permission.';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw 'Location permissions are permanently denied. Enable them in settings.';
    }

    // Mengambil posisi terkini
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
