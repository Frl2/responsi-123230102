import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import 'character_controller.dart';

class CharacterView extends GetView<CharacterController> {
  const CharacterView({super.key});

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
                  onPressed: controller.loadCharacters,
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        );
      }
      return ListView.builder(
        itemCount: controller.characters.length,
        itemBuilder: (context, index) {
          final character = controller.characters[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: character.image.isNotEmpty
                  ? CachedNetworkImageProvider(character.image)
                  : null,
              child: character.image.isEmpty
                  ? const Icon(Icons.person)
                  : null,
            ),
            title: Text(
              character.fullName,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(character.interpretedBy),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Get.toNamed(
              AppRoutes.characterDetail,
              arguments: character,
            ),
          );
        },
      );
    });
  }
}
