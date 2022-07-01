class UserModel {
  int? status;
  String? message;
  List<UserAccount>? account = [];
  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    json['account'].forEach((element) {
      account!.add(UserAccount.fromJson(element));
    });
  }
}

class UserAccount {
  int? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? updatedAt;
  String? createdAt;

  UserAccount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }
}
