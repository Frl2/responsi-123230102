class CharacterModel {
  final int index;
  final String fullName;
  final String nickname;
  final String hogwartsHouse;
  final String interpretedBy;
  final List<String> children;
  final String image;
  final String birthdate;

  CharacterModel({
    required this.index,
    required this.fullName,
    required this.nickname,
    required this.hogwartsHouse,
    required this.interpretedBy,
    required this.children,
    required this.image,
    required this.birthdate,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      index: json['index'] ?? 0,
      fullName: json['fullName'] ?? '',
      nickname: json['nickname'] ?? '',
      hogwartsHouse: json['hogwartsHouse'] ?? '',
      interpretedBy: json['interpretedBy'] ?? '',
      children: List<String>.from(json['children'] ?? []),
      image: json['image'] ?? '',
      birthdate: json['birthdate'] ?? '',
    );
  }
}
