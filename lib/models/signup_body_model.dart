class SignUpBody {
  String name;
  String phone;
  String email;
  String password;

  SignUpBody(
      {required this.name,
      required this.phone,
      this.email = '',
      required this.password});

  factory SignUpBody.fromJson(Map<String, dynamic> json) {
    return SignUpBody(
        name: json['f_name'],
        phone: json['phone'],
        email: json['email'],
        password: json['password']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['f_name'] = this.name;

    data['phone'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
