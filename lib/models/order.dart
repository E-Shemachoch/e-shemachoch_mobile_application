import 'package:eshemachoch_mobile_application/models/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.snake, includeIfNull: false)
class Order {
  Order(this.id, this.products, this.totalPrice, this.totalQuantity,
      this.consumerId, this.phoneNumber, this.claimed, this.date);
  final String? id;
  final List<Product> products;
  final double totalPrice;
  final int totalQuantity;
  final String consumerId;
  final String phoneNumber;
  final bool claimed;
  final int date;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);

  static Order empty() => Order(null, [], 0, 0, '', '', false, 0);

  Order copyWith({
    String? consumerId,
    String? phoneNumber,
    double? totalPrice,
    int? totalQuantity,
    int? date,
  }) =>
      Order(
        this.id,
        this.products,
        totalPrice ?? this.totalPrice,
        totalQuantity ?? this.totalQuantity,
        consumerId ?? this.consumerId,
        phoneNumber ?? this.phoneNumber,
        this.claimed,
        date ?? this.date,
      );
}
