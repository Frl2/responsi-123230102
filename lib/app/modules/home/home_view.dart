import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../routes/app_routes.dart';
import 'home_controller.dart';
import '../character/character_view.dart';
import '../spell/spell_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Get.offAllNamed(AppRoutes.login);
    Get.snackbar(
      'Success!',
      'Logged out Successfully',
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text(
              controller.currentIndex.value == 0
                  ? 'Harry Potter Characters'
                  : 'Harry Potter Spells Gallery',
            ),
            backgroundColor: Colors.green.shade800,
            foregroundColor: Colors.white,
            actions: [
              if (controller.currentIndex.value == 1)
                IconButton(
                  icon: const Icon(Icons.favorite),
                  tooltip: 'Favorite Spells',
                  onPressed: () => Get.toNamed(AppRoutes.favoriteSpells),
                ),
              IconButton(
                icon: const Icon(Icons.logout),
                tooltip: 'Logout',
                onPressed: _logout,
              ),
            ],
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: const [
              CharacterView(),
              SpellView(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeTab,
            selectedItemColor: Colors.green.shade800,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: 'Characters',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.auto_fix_high),
                label: 'Spells',
              ),
            ],
          ),
        ));
  }
}
