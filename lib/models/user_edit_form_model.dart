class UserEditFormModel {
  final String? username;
  final String? name;
  final String? email;
  final String? password;

  UserEditFormModel({
    this.username,
    this.name,
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'name': name,
      'email': email,
      'password': password,
    }..removeWhere((key, value) => value == null);
  }

  // Override toString method
  @override
  String toString() {
    return 'UserEditFormModel{username: $username, name: $name, email: $email, password: $password}';
  }
}
