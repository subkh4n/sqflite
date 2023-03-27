class User {
  String? address;
  int? id;
  String? name;

  User({required this.address, required this.id, required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      address: json['address'],
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
