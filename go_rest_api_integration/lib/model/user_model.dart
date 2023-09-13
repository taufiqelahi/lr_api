class User {
  User(
      {required this.id,
      required this.username,
      required this.email,
      required this.createdAt});

  int id;
  String username;

  String email;
  String createdAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["ID"],
      username: json["username"],
      email: json["email"],
      createdAt: json['CreatedAt']);

  Map<String, dynamic> toJson() =>
      {"ID": id, "name": username, "email": email, 'CreatedAt': createdAt};
}
