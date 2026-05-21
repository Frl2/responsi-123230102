import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'spell_controller.dart';

class SpellView extends GetView<SpellController> {
  const SpellView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      if (controller.errorMessage.value.isNotEmpty) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(controller.errorMessage.value,
                    textAlign: TextAlign.center),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: controller.loadSpells,
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        );
      }
      return ListView.builder(
        itemCount: controller.spells.length,
        itemBuilder: (context, index) {
          final spell = controller.spells[index];
          final isFav = controller.isFavorite(spell.index);
          return ListTile(
            leading: const Icon(Icons.auto_fix_high),
            title: Text(
              spell.spell,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(spell.use),
            trailing: IconButton(
              icon: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: isFav ? Colors.red : Colors.grey,
              ),
              onPressed: () => controller.toggleFavorite(spell),
            ),
          );
        },
      );
    });
  }
}
