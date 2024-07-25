class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? password;
  final String? username;
  final int? verified;
  final String? profilePcture;
  final int? balance;
  final String? cardNumber;
  final String? pin;
  final String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.username,
    this.verified,
    this.profilePcture,
    this.balance,
    this.cardNumber,
    this.pin,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        username: json['username'],
        verified: json['verified'],
        profilePcture: json['profile_picture'],
        balance: json['balance'],
        cardNumber: json['card_number'],
        pin: json['pin'],
        token: json['token'],
      );
  UserModel copyWith({
    String? username,
    String? name,
    String? email,
    String? pin,
    String? password,
    int? balance,
  }) =>
      UserModel(
        id: id,
        username: username ?? this.username,
        name: name ?? this.name,
        email: email ?? this.email,
        pin: pin ?? this.pin,
        password: password ?? this.password,
        balance: balance ?? this.balance,
        verified: verified,
        profilePcture: profilePcture,
        cardNumber: cardNumber,
        token: token,
      );
      // Override toString method
  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, email: $email, password: $password, username: $username, verified: $verified, profilePcture: $profilePcture}';
  }
}
