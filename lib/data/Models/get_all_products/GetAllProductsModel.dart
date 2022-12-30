/// _id : "63ab2da05cb9e51b47170cb0"
/// name : "Product3333"
/// flavor : "productFalvor"
/// price : 1
/// quantity : 10
/// weight : 25
/// validDate : "DateNow"
/// expDate : "DateAfterNow"
/// img : "http://localhost:3500/undefined"
/// __v : 0

class GetAllProductsModel {
  GetAllProductsModel({
      this.id, 
      this.name, 
      this.flavor, 
      this.price, 
      this.quantity, 
      this.weight, 
      this.validDate, 
      this.expDate, 
      this.img, 
      this.v,});

  GetAllProductsModel.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    flavor = json['flavor'];
    price = json['price'];
    quantity = json['quantity'];
    weight = json['weight'];
    validDate = json['validDate'];
    expDate = json['expDate'];
    img = json['img'];
    v = json['__v'];
  }
  String? id;
  String? name;
  String? flavor;
  num? price;
  num? quantity;
  num? weight;
  String? validDate;
  String? expDate;
  String? img;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['flavor'] = flavor;
    map['price'] = price;
    map['quantity'] = quantity;
    map['weight'] = weight;
    map['validDate'] = validDate;
    map['expDate'] = expDate;
    map['img'] = img;
    map['__v'] = v;
    return map;
  }

}