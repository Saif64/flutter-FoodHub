import 'package:food_delivery/models/product_model.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  String? location;
  int? quantity;
  bool? isExist;
  String? time;
  ProductModel? product;

  CartModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.location,
    this.quantity,
    this.isExist,
    this.time,
    this.product,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    location = json['location'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];
    product = ProductModel.fromJson(json['product']);
  }
}
