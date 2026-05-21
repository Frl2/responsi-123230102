import 'dart:convert';

class SpellModel {
  final int index;
  final String spell;
  final String use;
  final String? image;

  SpellModel({
    required this.index,
    required this.spell,
    required this.use,
    this.image,
  });

  factory SpellModel.fromJson(Map<String, dynamic> json) {
    return SpellModel(
      index: json['index'] ?? 0,
      spell: json['spell'] ?? '',
      use: json['use'] ?? '',
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
        'index': index,
        'spell': spell,
        'use': use,
        'image': image,
      };

  String toJsonString() => jsonEncode(toJson());

  factory SpellModel.fromJsonString(String jsonString) =>
      SpellModel.fromJson(jsonDecode(jsonString));
}
