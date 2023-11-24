class AuthResponse {
  final String token;
  final UserData user;

  AuthResponse({
    required this.token,
    required this.user,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token'] as String,
      user: UserData.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  @override
  String toString() {
    return 'AuthResponse{token: $token, user: $user}';
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'user': user.toJson(),
    };
  }


}

class UserData {
  final int id;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String? grade;
  final String? dateNaissance;
  final String? lieuNaissance;
  final String telephone;
  final String role;
  final String? profile;
  final String? createdAt;
  final String? updatedAt;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    this.grade,
    this.dateNaissance,
    this.lieuNaissance,
    required this.telephone,
    required this.role,
    this.profile,
    this.createdAt,
    this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      emailVerifiedAt: json['email_verified_at'] as String?,
      grade: json['grade'] as String?,
      dateNaissance: json['date_naissance'] as String?,
      lieuNaissance: json['lieu_naissance'] as String?,
      telephone: json['telephone'] as String,
      role: json['role'] as String,
      profile: json['profile'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'grade': grade,
      'date_naissance': dateNaissance,
      'lieu_naissance': lieuNaissance,
      'telephone': telephone,
      'role': role,
      'profile': profile,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  @override
  String toString() {
    return 'UserData{id: $id, name: $name, email: $email, ... (autres propriétés)}';
  }


}