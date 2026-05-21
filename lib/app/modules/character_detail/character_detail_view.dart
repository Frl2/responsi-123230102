import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/character_model.dart';

class CharacterDetailView extends StatelessWidget {
  const CharacterDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final CharacterModel character = Get.arguments as CharacterModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(character.fullName),
        backgroundColor: Colors.green.shade800,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (character.image.isNotEmpty)
              CachedNetworkImage(
                imageUrl: character.image,
                width: double.infinity,
                height: 280,
                fit: BoxFit.cover,
                placeholder: (context, url) => const SizedBox(
                  height: 280,
                  child: Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => const SizedBox(
                  height: 180,
                  child: Center(child: Icon(Icons.broken_image, size: 64)),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _row('Full Name', character.fullName),
                  _row('Nickname', character.nickname),
                  _row('Hogwarts House', character.hogwartsHouse),
                  _row('Interpreted By', character.interpretedBy),
                  _row('Birthdate', character.birthdate),
                  _row(
                    'Children',
                    character.children.isEmpty
                        ? 'None'
                        : character.children.join(', '),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(value.isNotEmpty ? value : '-'),
          ),
        ],
      ),
    );
  }
}
