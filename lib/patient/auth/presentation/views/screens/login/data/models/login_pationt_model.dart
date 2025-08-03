class LoginPationtModel {
  final int id;

  final String fullname;
  final String email;
  final String birthday;
  final String imageurl;
  final String phonenumber;
  final String token;

  LoginPationtModel({
    required this.id,
    
    required this.fullname,
    required this.email,
    required this.birthday,
    required this.imageurl,
    required this.phonenumber,
    required this.token,
  });

  factory LoginPationtModel.fromJson(Map<String, dynamic> json) {
    return LoginPationtModel(
      id: json['id'] ?? 0,
      fullname: json['fullName'] ?? '',
      email: json['email'] ?? '',
      birthday: json['birthday'] ?? '',
      imageurl: json['imageUrl'] ?? '',
      phonenumber: json['phoneNumber'] ?? '',
      token: json['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': fullname,
      'email': email,
      'birthday': birthday,
      'imageurl': imageurl,
      'phonenumber': phonenumber,
      'token': token,
    };
  }
}


  

     