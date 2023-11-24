class AuthModel {
  final String telephone;
  final String password;

  AuthModel({
    required this.telephone,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'telephone': telephone,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'AuthModel { telephone: $telephone, password: $password }';
  }
}

