// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FoodDataModel {
  bool liked;
  String name;
  String price;
  FoodDataModel({
    required this.liked,
    required this.name,
    required this.price,
  });

  FoodDataModel copyWith({
    bool? liked,
    String? name,
    String? price,
  }) {
    return FoodDataModel(
      liked: liked ?? this.liked,
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'liked': liked,
      'name': name,
      'price': price,
    };
  }

  factory FoodDataModel.fromMap(Map<String, dynamic> map) {
    return FoodDataModel(
      liked: map['liked'] as bool,
      name: map['name'] as String,
      price: map['price'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodDataModel.fromJson(String source) =>
      FoodDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'FoodDataModel(liked: $liked, name: $name, price: $price)';

  @override
  bool operator ==(covariant FoodDataModel other) {
    if (identical(this, other)) return true;

    return other.liked == liked && other.name == name && other.price == price;
  }

  @override
  int get hashCode => liked.hashCode ^ name.hashCode ^ price.hashCode;
}
