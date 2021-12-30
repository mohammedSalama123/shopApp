/// status : true
/// message : "تمت الإضافة بنجاح"
/// data : {"id":41620,"product":{"id":53,"price":5599,"old_price":10230,"discount":45,"image":"https://student.valuxapps.com/storage/uploads/products/1615440689wYMHV.item_XXL_36330138_142814934.jpeg"}}

class ChangeFavoriteModel {
  ChangeFavoriteModel({
      this.status, 
      this.message, 
      this.data,});

  ChangeFavoriteModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// id : 41620
/// product : {"id":53,"price":5599,"old_price":10230,"discount":45,"image":"https://student.valuxapps.com/storage/uploads/products/1615440689wYMHV.item_XXL_36330138_142814934.jpeg"}

class Data {
  Data({
      this.id, 
      this.product,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
  }
  int? id;
  Product? product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    return map;
  }

}

/// id : 53
/// price : 5599
/// old_price : 10230
/// discount : 45
/// image : "https://student.valuxapps.com/storage/uploads/products/1615440689wYMHV.item_XXL_36330138_142814934.jpeg"

class Product {
  Product({
      this.id, 
      this.price, 
      this.oldPrice, 
      this.discount, 
      this.image,});

  Product.fromJson(dynamic json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
  }
  int? id;
  int? price;
  int? oldPrice;
  int? discount;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['price'] = price;
    map['old_price'] = oldPrice;
    map['discount'] = discount;
    map['image'] = image;
    return map;
  }

}