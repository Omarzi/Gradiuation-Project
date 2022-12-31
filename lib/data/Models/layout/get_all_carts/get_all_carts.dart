// // To parse this JSON data, do
// //
// //     final getAllCartsModel = getAllCartsModelFromJson(jsonString);
// import 'dart:convert';

// GetAllCartsModel getAllCartsModelFromJson(String str) => GetAllCartsModel.fromJson(json.decode(str));

// String getAllCartsModelToJson(GetAllCartsModel data) => json.encode(data.toJson());

// class GetAllCartsModel {
//     GetAllCartsModel({
//         required this.id,
//         required this.userId,
//         required this.products,
//         required this.createdAt,
//         required this.updatedAt,
//         required this.v,
//     });

//     String id;
//     String userId;
//     List<CartModel> products;
//     DateTime createdAt;
//     DateTime updatedAt;
//     int v;

//     factory GetAllCartsModel.fromJson(Map<String, dynamic> json) => GetAllCartsModel(
//         id: json["_id"],
//         userId: json["userId"],
//         products: List<CartModel>.from(json["products"].map((x) => CartModel.fromJson(x))),
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "userId": userId,
//         "products": List<dynamic>.from(products.map((x) => x.toJson())),
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "__v": v,
//     };
// }

// class CartModel {
//     CartModel({
//         required this.productId,
//         required this.quantity,
//         required this.totalPrice,
//         required this.id,
//     });

//     String productId;
//     int quantity;
//     int totalPrice;
//     String id;

//     factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
//         productId: json["productId"],
//         quantity: json["quantity"],
//         totalPrice: json["totalPrice"],
//         id: json["_id"],
//     );

//     Map<String, dynamic> toJson() => {
//         "productId": productId,
//         "quantity": quantity,
//         "totalPrice": totalPrice,
//         "_id": id,
//     };
// }


class CartModel {
  String? productId;
  double? quantity;
  double? totalPrice;
  String? sId;

  CartModel({this.productId, this.quantity, this.totalPrice, this.sId});

  CartModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    quantity = json['quantity'];
    totalPrice = json['totalPrice'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['quantity'] = this.quantity;
    data['totalPrice'] = this.totalPrice;
    data['_id'] = this.sId;
    return data;
  }
}