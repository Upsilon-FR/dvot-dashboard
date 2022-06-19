class User {
  final String id;
  final String lastName;
  final String firstName;
  final String mail;
  final String birthDate;
  final String birthPlace;
  final String gender;
  final String role;

  User({required this.id, required this.lastName, required this.firstName, required this.mail, required this.birthDate,
    required this.birthPlace, required this.gender, required this.role});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["_id"] as String,
      lastName: json["nom"] as String,
      firstName: json["prenom"] as String,
      mail: json["mail"] as String,
      birthDate: json["date_naissance"] as String,
      birthPlace: json["lieu_naissance"] as String,
      gender: json["genre"] as String,
      role: json["role"] as String
    );
  }
}