/// status : true
/// message : "تم تسجيل الدخول بنجاح"
/// data : {"id":10163,"name":"mohamed salama","email":"mode3salam33@gmail.com","phone":"01110169611","image":"https://student.valuxapps.com/storage/assets/defaults/user.jpg","points":0,"credit":0,"token":"QdoHPgURbWnHm4DQ66TMBWrpLPPdqEX833zZPJ0fUR780X4GRVJuSTJ2rw8y4IXIq6PVlZ"}

class LoginModel {
  LoginModel({
      this.status, 
      this.message, 
      this.data,});

  LoginModel.fromJson(dynamic json) {
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

/// id : 10163
/// name : "mohamed salama"
/// email : "mode3salam33@gmail.com"
/// phone : "01110169613"
/// image : "https://student.valuxapps.com/storage/assets/defaults/user.jpg"
/// points : 0
/// credit : 0
/// token : "QdoHPgURbWnHm4DQ66TMBWrpLPPdqEX833zZPJ0fUR780X4GRVJuSTJ2rw8y4IXIq6PVlZ"

class Data {
  Data({
      this.id, 
      this.name, 
      this.email, 
      this.phone, 
      this.image, 
      this.points, 
      this.credit, 
      this.token,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['image'] = image;
    map['points'] = points;
    map['credit'] = credit;
    map['token'] = token;
    return map;
  }

}