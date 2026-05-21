class BookModel {
  final int index;
  final int number;
  final String title;
  final String originalTitle;
  final String releaseDate;
  final String description;
  final int pages;
  final String cover;

  BookModel({
    required this.index,
    required this.number,
    required this.title,
    required this.originalTitle,
    required this.releaseDate,
    required this.description,
    required this.pages,
    required this.cover,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      index: json['index'] ?? 0,
      number: json['number'] ?? 0,
      title: json['title'] ?? '',
      originalTitle: json['originalTitle'] ?? '',
      releaseDate: json['releaseDate'] ?? '',
      description: json['description'] ?? '',
      pages: json['pages'] ?? 0,
      cover: json['cover'] ?? '',
    );
  }
}
