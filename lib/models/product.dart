import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Product {
  Product(this.id, this.name, this.price, this.quantity, this.image, this.date);

  final String? id;
  final String name;
  final double price;
  final int quantity;
  final String image;
  final int date;

<<<<<<< Updated upstream
  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
=======
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
>>>>>>> Stashed changes

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  Product copyWith(
          {String? id,
          String? name,
          double? price,
          int? quantity,
          String? image,
          int? date}) =>
      Product(
<<<<<<< Updated upstream
        id,
=======
        id ?? this.id,
>>>>>>> Stashed changes
        name ?? this.name,
        price ?? this.price,
        quantity ?? this.quantity,
        image ?? this.image,
        date ?? this.date,
      );
  static Product empty() => Product('', '', 0, 0, '', 0);
}
