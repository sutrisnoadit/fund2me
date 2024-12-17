import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/my_address_controller.dart';

class MyAddressView extends GetView<MyAddressController> {
  const MyAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController addressController = TextEditingController();
    final TextEditingController editAddressController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alamat Saya',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF692729),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        children: [
 
          
          Expanded(
            child: Container(
              color: const Color(0xfff2cebe),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // Input Tambah Alamat
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: TextField(
                      controller: addressController,
                      decoration: const InputDecoration(
                        labelText: 'Masukkan Alamat',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF692729),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                    onPressed: () {
                      if (addressController.text.isNotEmpty) {
                        controller.addAddress(addressController.text);
                        addressController.clear();
                      }
                    },
                    child: const Text(
                      'Tambah Alamat',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Obx(
                      () => ListView.builder(
                        itemCount: controller.addresses.length,
                        itemBuilder: (context, index) {
                          final addressData = controller.addresses[index];
                          final documentId = addressData['documentId'];
                          final address = addressData['address'];

                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            color: Colors.white,
                            child: ListTile(
                              title: Text(
                                address,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit,
                                        color: Color(0xFF4E342E)),
                                    onPressed: () {
                                      editAddressController.text = address;
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: const Text('Edit Alamat'),
                                          content: TextField(
                                            controller: editAddressController,
                                            decoration: const InputDecoration(
                                              labelText: 'Edit Alamat',
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                controller.updateAddress(
                                                  documentId,
                                                  editAddressController.text,
                                                );
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                'Simpan',
                                                style: TextStyle(
                                                    color: Color(0xFF692729)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.redAccent),
                                    onPressed: () =>
                                        controller.deleteAddress(documentId),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
