import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../data/models/spell_model.dart';
import '../../services/notification_service.dart';

class FavoriteSpellController extends GetxController {
  final _favBox = Hive.box('favorites');
  final favoriteSpells = <SpellModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  void loadFavorites() {
    final spells = <SpellModel>[];
    for (final key in _favBox.keys) {
      final String? json = _favBox.get(key);
      if (json != null) {
        spells.add(SpellModel.fromJsonString(json));
      }
    }
    favoriteSpells.value = spells;
  }

  Future<void> removeFavorite(SpellModel spell) async {
    _favBox.delete(spell.index.toString());
    favoriteSpells.remove(spell);
    await NotificationService.showDeleteNotification(spell.spell);
  }
}
