import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MyAddressController extends GetxController {
  final addresses = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadAddresses();
  }

  void loadAddresses() {
    FirebaseFirestore.instance
        .collection('address')
        .orderBy('address', descending: true)
        .snapshots()
        .listen((snapshot) {
      addresses.clear();
      for (var doc in snapshot.docs) {
        print("Fetched address: ${doc['address']}");
        addresses.add({
          'documentId': doc.id,
          'address': doc['address'],
        });
      }
    });
  }

  void addAddress(String newAddress) async {
    await FirebaseFirestore.instance
        .collection('address')
        .add({'address': newAddress});
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
