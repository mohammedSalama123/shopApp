class CategoriesModel {
  bool? status;
  dynamic message;
  Data? data;

  CategoriesModel({
    this.status,
    this.message,
    this.data,
  });

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] as bool?;
    message = json['message'];
    data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['status'] = status;
    json['message'] = message;
    json['data'] = data?.toJson();
    return json;
  }
}

class Data {
  int? currentPage;
  List<DataModel>? data;
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
    this.total,
  });

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'] as int?;
    data = (json['data'] as List?)?.map((dynamic e) => DataModel.fromJson(e as Map<String,dynamic>)).toList();
    firstPageUrl = json['first_page_url'] as String?;
    from = json['from'] as int?;
    lastPage = json['last_page'] as int?;
    lastPageUrl = json['last_page_url'] as String?;
    nextPageUrl = json['next_page_url'];
    path = json['path'] as String?;
    perPage = json['per_page'] as int?;
    prevPageUrl = json['prev_page_url'];
    to = json['to'] as int?;
    total = json['total'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['current_page'] = currentPage;
    json['data'] = data?.map((e) => e.toJson()).toList();
    json['first_page_url'] = firstPageUrl;
    json['from'] = from;
    json['last_page'] = lastPage;
    json['last_page_url'] = lastPageUrl;
    json['next_page_url'] = nextPageUrl;
    json['path'] = path;
    json['per_page'] = perPage;
    json['prev_page_url'] = prevPageUrl;
    json['to'] = to;
    json['total'] = total;
    return json;
  }
}

class DataModel {
  int? id;
  String? name;
  String? image;

  DataModel({
    this.id,
    this.name,
    this.image,
  });

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    image = json['image'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['image'] = image;
    return json;
  }
}