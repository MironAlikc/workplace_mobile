class TokenModel {
  Data? data;
  String? message;
  bool? error;

  TokenModel({this.data, this.message, this.error});

  TokenModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['error'] = error;
    return data;
  }
}

class Data {
  int? idRole;
  int? idUser;
  String? toKen;

  Data({this.idRole, this.idUser, this.toKen});

  Data.fromJson(Map<String, dynamic> json) {
    idRole = json['idRole'];
    idUser = json['idUser'];
    toKen = json['toKen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idRole'] = idRole;
    data['idUser'] = idUser;
    data['toKen'] = toKen;
    return data;
  }
}
