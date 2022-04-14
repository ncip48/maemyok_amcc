class Product {
  final String id;
  final int price;
  final String name;
  final String desc;
  final String type;
  final String image;

  Product(
      {required this.id,
      required this.price,
      required this.name,
      required this.desc,
      required this.type,
      required this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      price: json['hargaDasar'],
      name: json['nama'],
      desc: json['keterangan'],
      type: json['typedesc'],
      image: json['imgurl'],
    );
  }

  @override
  String toString() {
    return '{id: $id, price: $price, name: $name, desc: $desc, type: $type, image: $image}';
  }
}
