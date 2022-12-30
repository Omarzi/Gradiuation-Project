class GetAllProductsModel {
  List<Products>? products;

  GetAllProductsModel({this.products});

  GetAllProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['Products'] != null) {
      products = <Products>[];
      json['Products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['Products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? sId;
  String? name;
  String? flavor;
  int? price;
  int? quantity;
  int? weight;
  String? validDate;
  String? expDate;
  String? img;
  int? iV;

  Products(
      {this.sId,
      this.name,
      this.flavor,
      this.price,
      this.quantity,
      this.weight,
      this.validDate,
      this.expDate,
      this.img,
      this.iV});

  Products.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    flavor = json['flavor'];
    price = json['price'];
    quantity = json['quantity'];
    weight = json['weight'];
    validDate = json['validDate'];
    expDate = json['expDate'];
    img = json['img'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['flavor'] = flavor;
    data['price'] = price;
    data['quantity'] = quantity;
    data['weight'] = weight;
    data['validDate'] = validDate;
    data['expDate'] = expDate;
    data['img'] = img;
    data['__v'] = iV;
    return data;
  }
}