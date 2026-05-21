import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'favorite_spell_controller.dart';

class FavoriteSpellView extends GetView<FavoriteSpellController> {
  const FavoriteSpellView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Spell'),
        backgroundColor: Colors.green.shade800,
        foregroundColor: Colors.white,
      ),
      body: Obx(() {
        if (controller.favoriteSpells.isEmpty) {
          return const Center(
            child: Text(
              'No favorite spells yet.\nGo to Spells and tap the heart icon!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          );
        }
        return ListView.builder(
          itemCount: controller.favoriteSpells.length,
          itemBuilder: (context, index) {
            final spell = controller.favoriteSpells[index];
            return ListTile(
              leading: const Icon(Icons.auto_fix_high),
              title: Text(
                spell.spell,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(spell.use),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => controller.removeFavorite(spell),
              ),
            );
          },
        );
      }),
    );
  }
}
