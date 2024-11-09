import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import 'package:fund2me1/app/routes/app_pages.dart';
import '../../setting/views/setting_view.dart';

class DashboardView extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2cebe),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: PreferredSize(
              preferredSize: Size.fromHeight(160.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xff692729),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage('assets/img/hilma.png'),
                            radius: 25,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              decoration: BoxDecoration(
                                color: Color(0xfff1e8dc),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.menu, color: Color(0xff692729)),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Hinted search text',
                                        hintStyle:
                                            TextStyle(color: Colors.black54),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.search, color: Color(0xff692729)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hai, Friends',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Let’s help those who needs!',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.wallet,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(child: _buildBody())
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: Container(
          color: Color(0xff692729),
          child: Obx(() {
            return BottomNavigationBar(
              currentIndex: controller.selectedIndex.value,
              onTap: (index) {
                _onItemTapped(index);
              },
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white54,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: Color(0xff692729),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper),
                  label: 'News',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    controller.selectedIndex.value = index;
    switch (index) {
      case 0:
        break;
      case 1:
        // Get.toNamed('/favorite');
        break;
      case 2:
        Get.toNamed(Routes.NEWS);
        break;
      case 3:
        // Get.toNamed('/settings'); // Settings routing untuk konsistensi
        break;
    }
  }

  Widget _buildBody() {
    return Obx(() {
      switch (controller.selectedIndex.value) {
        case 0:
          return _buildHomeContent();
        case 1:
          return _buildFavoriteContent();
        case 2:
          return _buildLocationContent();
        case 3:
          return _buildSettingsContent();
        default:
          return _buildHomeContent();
      }
    });
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 180), // Agar tidak menutupi AppBar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategoryIcon('Sosial', Icons.people),
                _buildCategoryIcon('Bencana', Icons.warning),
                _buildCategoryIcon('Pendidikan', Icons.book),
                _buildCategoryIcon('Kesehatan', Icons.favorite),
              ],
            ),
          ),
          SizedBox(height: 20),
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Yuk, Mulai Bantu!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff692729),
              ),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildHelpCard(
                  'Mitra Bantu',
                  'Rani, seorang anak perempuan berusia 6 tahun didiagnosis menderita stunting...',
                  'assets/img/gambar1.png',
                ),
                _buildHelpCard(
                  'Mitra Bantu',
                  'Sekolah Desa Harapan, satu-satunya berada dalam kondisi yang memprihatinkan...',
                  'assets/img/gambar2.png',
                ),
                _buildHelpCard(
                  'Mitra Bantu 2',
                  'Sekolah Desa Harapan, satu-satunya berada dalam kondisi yang memprihatinkan...',
                  'assets/img/gambar2.png',
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          _buildDailyChallengeCard(
            'Tantangan Harian:',
            'Bantu 10 Anak Mendapatkan Akses Pendidikan Hari Ini\nAyo, berkontribusi sekarang dan bantu anak-anak mendapatkan pendidikan yang layak. Setiap donasi kecil dapat membuat perbedaan besar!',
            0.7, // Progress 70%
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildFavoriteContent() {
    return Center(
      child: Text('Profile'),
    );
  }

  Widget _buildLocationContent() {
    return Center(
      child: Text('Location'),
    );
  }

  Widget _buildSettingsContent() {
    return Center(
      child: SettingView(),
    );
  }

  Widget _buildCategoryIcon(String title, IconData icon) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xfff1e8dc),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon, size: 30, color: Color(0xff692729)),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(fontSize: 14, color: Colors.black87),
        ),
      ],
    );
  }

  Widget _buildHelpCard(String title, String description, String imagePath) {
    return Container(
      width: 190,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Color(0xfff1e8dc),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset(
              imagePath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff692729),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyChallengeCard(
      String title, String description, double progress) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xfff1e8dc),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff692729),
                ),
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff692729)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
