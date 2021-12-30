/// status : true
/// message : null
/// data : {"current_page":1,"data":[{"id":41620,"product":{"id":53,"price":5599,"old_price":10230,"discount":45,"image":"https://student.valuxapps.com/storage/uploads/products/1615440689wYMHV.item_XXL_36330138_142814934.jpeg","name":"مكبر صوت بلوتوث مقاوم للمياه ومحمول اكستريم 2 من جيه بي ال JBLXTREME2BLUAM - ازرق","description":"مدة تشغيل الموسيقى: 15 ساعة\r\nالطاقة المخرجة (وات): 2 × 20\r\nالأبعاد: 13.6 × 28.8 × 13.2 سنتيمتر\r\nالوزن: 2.39 كيلوجرام\r\nاصدار البلوتوث: 4.2\r\nسعة البطارية: 10000 مللي امبير في الساعة\r\nمدة الشحن: 3 ساعات ونصف\r\nمدخل كابل صوت 3.5 ملم: متاح\r\nخاصية إيقاف التشغيل التلقائي: متاحة\r\nتقنية البلوتوث: متاحة\r\nيدعم تطبيق جيه بي ال كونيكت+: نعم \r\nشاحن باور بانك: متاح\r\nمكبر صوت خارجي: متاح\r\nخاصية المساعد الصوتي: متاحة\r\nمقاوم للمياه: نعم"}}],"first_page_url":"https://student.valuxapps.com/api/favorites?page=1","from":1,"last_page":1,"last_page_url":"https://student.valuxapps.com/api/favorites?page=1","next_page_url":null,"path":"https://student.valuxapps.com/api/favorites","per_page":35,"prev_page_url":null,"to":1,"total":1}

class GetFavoritesModel {
  GetFavoritesModel({
      this.status, 
      this.message, 
      this.data,});

  GetFavoritesModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  dynamic message;
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

/// current_page : 1
/// data : [{"id":41620,"product":{"id":53,"price":5599,"old_price":10230,"discount":45,"image":"https://student.valuxapps.com/storage/uploads/products/1615440689wYMHV.item_XXL_36330138_142814934.jpeg","name":"مكبر صوت بلوتوث مقاوم للمياه ومحمول اكستريم 2 من جيه بي ال JBLXTREME2BLUAM - ازرق","description":"مدة تشغيل الموسيقى: 15 ساعة\r\nالطاقة المخرجة (وات): 2 × 20\r\nالأبعاد: 13.6 × 28.8 × 13.2 سنتيمتر\r\nالوزن: 2.39 كيلوجرام\r\nاصدار البلوتوث: 4.2\r\nسعة البطارية: 10000 مللي امبير في الساعة\r\nمدة الشحن: 3 ساعات ونصف\r\nمدخل كابل صوت 3.5 ملم: متاح\r\nخاصية إيقاف التشغيل التلقائي: متاحة\r\nتقنية البلوتوث: متاحة\r\nيدعم تطبيق جيه بي ال كونيكت+: نعم \r\nشاحن باور بانك: متاح\r\nمكبر صوت خارجي: متاح\r\nخاصية المساعد الصوتي: متاحة\r\nمقاوم للمياه: نعم"}}]
/// first_page_url : "https://student.valuxapps.com/api/favorites?page=1"
/// from : 1
/// last_page : 1
/// last_page_url : "https://student.valuxapps.com/api/favorites?page=1"
/// next_page_url : null
/// path : "https://student.valuxapps.com/api/favorites"
/// per_page : 35
/// prev_page_url : null
/// to : 1
/// total : 1

class Data {
  Data({
      this.currentPage, 
      this.data, 
      this.firstPageUrl, 
      this.from, 
      this.lastPage, 
      this.lastPageUrl, 
      this.nextPageUrl, 
      this.path, 
      this.perPage, 
      this.prevPageUrl, 
      this.to, 
      this.total,});

  Data.fromJson(dynamic json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(FavData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
  int? currentPage;
  List<FavData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = currentPage;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = firstPageUrl;
    map['from'] = from;
    map['last_page'] = lastPage;
    map['last_page_url'] = lastPageUrl;
    map['next_page_url'] = nextPageUrl;
    map['path'] = path;
    map['per_page'] = perPage;
    map['prev_page_url'] = prevPageUrl;
    map['to'] = to;
    map['total'] = total;
    return map;
  }

}

/// id : 41620
/// product : {"id":53,"price":5599,"old_price":10230,"discount":45,"image":"https://student.valuxapps.com/storage/uploads/products/1615440689wYMHV.item_XXL_36330138_142814934.jpeg","name":"مكبر صوت بلوتوث مقاوم للمياه ومحمول اكستريم 2 من جيه بي ال JBLXTREME2BLUAM - ازرق","description":"مدة تشغيل الموسيقى: 15 ساعة\r\nالطاقة المخرجة (وات): 2 × 20\r\nالأبعاد: 13.6 × 28.8 × 13.2 سنتيمتر\r\nالوزن: 2.39 كيلوجرام\r\nاصدار البلوتوث: 4.2\r\nسعة البطارية: 10000 مللي امبير في الساعة\r\nمدة الشحن: 3 ساعات ونصف\r\nمدخل كابل صوت 3.5 ملم: متاح\r\nخاصية إيقاف التشغيل التلقائي: متاحة\r\nتقنية البلوتوث: متاحة\r\nيدعم تطبيق جيه بي ال كونيكت+: نعم \r\nشاحن باور بانك: متاح\r\nمكبر صوت خارجي: متاح\r\nخاصية المساعد الصوتي: متاحة\r\nمقاوم للمياه: نعم"}

class FavData {
  FavData({
      this.id, 
      this.product,});

  FavData.fromJson(dynamic json) {
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
/// name : "مكبر صوت بلوتوث مقاوم للمياه ومحمول اكستريم 2 من جيه بي ال JBLXTREME2BLUAM - ازرق"
/// description : "مدة تشغيل الموسيقى: 15 ساعة\r\nالطاقة المخرجة (وات): 2 × 20\r\nالأبعاد: 13.6 × 28.8 × 13.2 سنتيمتر\r\nالوزن: 2.39 كيلوجرام\r\nاصدار البلوتوث: 4.2\r\nسعة البطارية: 10000 مللي امبير في الساعة\r\nمدة الشحن: 3 ساعات ونصف\r\nمدخل كابل صوت 3.5 ملم: متاح\r\nخاصية إيقاف التشغيل التلقائي: متاحة\r\nتقنية البلوتوث: متاحة\r\nيدعم تطبيق جيه بي ال كونيكت+: نعم \r\nشاحن باور بانك: متاح\r\nمكبر صوت خارجي: متاح\r\nخاصية المساعد الصوتي: متاحة\r\nمقاوم للمياه: نعم"

class Product {
  Product({
      this.id, 
      this.price, 
      this.oldPrice, 
      this.discount, 
      this.image, 
      this.name, 
      this.description,});

  Product.fromJson(dynamic json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }
  int? id;
  int? price;
  int? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['price'] = price;
    map['old_price'] = oldPrice;
    map['discount'] = discount;
    map['image'] = image;
    map['name'] = name;
    map['description'] = description;
    return map;
  }

}