import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyAddressController extends GetxController {
  final addresses = <Map<String, dynamic>>[].obs;
  final RxBool isConnected = true.obs;  
  final localStorage = GetStorage();  
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    loadAddresses();
    uploadPendingData();
    _connectivity.onConnectivityChanged.listen((connectivityResults) {
      _updateConnectionStatus(connectivityResults.first);
    });
  }

 void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      if (isConnected.value) {
        isConnected.value = false;
        Get.snackbar("Koneksi Terputus", "Tidak ada koneksi internet!",
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
 
      if (!isConnected.value) {
        isConnected.value = true;
        Get.snackbar("Koneksi Terhubung", "Go Online ",
            snackPosition: SnackPosition.BOTTOM);
      }
      uploadPendingData();
    }}


  void loadAddresses() {
    FirebaseFirestore.instance
        .collection('address')
        .orderBy('address', descending: true)
        .snapshots()
        .listen((snapshot) {
      addresses.clear();
      for (var doc in snapshot.docs) {
        addresses.add({
          'documentId': doc.id,
          'address': doc['address'],
        });
      }
    });
  }


  void addAddress(String newAddress) async {
    if (isConnected.value) {
      await FirebaseFirestore.instance
          .collection('address')
          .add({'address': newAddress});
    } else {

      saveToLocal(newAddress);
    }
  }


  void saveToLocal(String newAddress) {
    List pendingData = localStorage.read<List>('pendingData') ?? [];
    pendingData.add({'address': newAddress});
    localStorage.write('pendingData', pendingData);
    Get.snackbar("Data Disimpan", "Alamat disimpan sementara karena offline.",
        snackPosition: SnackPosition.BOTTOM);
  }


  void uploadPendingData() async {
    List pendingData = localStorage.read<List>('pendingData') ?? [];
    for (var data in pendingData) {
      await FirebaseFirestore.instance.collection('address').add({
        'address': data['address'],
      });
    }
    localStorage.remove('pendingData');  
  }


  void updateAddress(String documentId, String updatedAddress) async {
    await FirebaseFirestore.instance
        .collection('address')
        .doc(documentId)
        .update({'address': updatedAddress});
  }

 
  void deleteAddress(String documentId) async {
    await FirebaseFirestore.instance
        .collection('address')
        .doc(documentId)
        .delete();
  }
}
