class User {
  int id;
  String username = "User";
  String email = 'NULL';

  User({
    required this.id,
    required this.username,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      email: json['email'],
      username: json['username'],
    );
  }
}
