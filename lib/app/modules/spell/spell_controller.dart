import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../data/models/spell_model.dart';
import '../../data/providers/api_provider.dart';

class SpellController extends GetxController {
  final _api = ApiProvider();
  final _favBox = Hive.box('favorites');
  final spells = <SpellModel>[].obs;
  final isLoading = true.obs;
  final errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadSpells();
  }

  Future<void> loadSpells() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      spells.value = await _api.getSpells();
    } catch (e) {
      errorMessage.value = 'Failed to load spells. Check your connection.';
    } finally {
      isLoading.value = false;
    }
  }

  bool isFavorite(int index) => _favBox.containsKey(index.toString());

  void toggleFavorite(SpellModel spell) {
    final key = spell.index.toString();
    if (_favBox.containsKey(key)) {
      _favBox.delete(key);
      Get.snackbar(
        'Removed!',
        '${spell.spell} removed from the list!',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    } else {
      _favBox.put(key, spell.toJsonString());
      Get.snackbar(
        'Add!',
        '${spell.spell} successfully added to the fav list!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    }
    spells.refresh();
  }
}
