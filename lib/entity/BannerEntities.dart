class BannerEntity {
  final String id;
  final String image;

  BannerEntity({required this.id, required this.image});

  factory BannerEntity.fromJson(Map<String, dynamic> json) {
    return BannerEntity(
      id: json['id'],
      image: json['image'],
    );
  }

  @override
  String toString() {
    return '{id: $id, image: $image}';
  }
}
