import 'package:dvot_dashboard_init/utils/random-string.dart';

class User {
  final String lastName;
  final String firstName;
  final String mail;
  final String birthDate;
  final String birthPlace;
  final String gender;
  final String role;

  User({required this.lastName, required this.firstName, required this.mail, required this.birthDate,
    required this.birthPlace, required this.gender, required this.role});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      lastName: json["nom"] as String,
      firstName: json["prenom"] as String,
      mail: json["mail"] as String,
      birthDate: json["date_naissance"] as String,
      birthPlace: json["lieu_naissance"] as String,
      gender: json["genre"] as String,
      role: json["role"] as String
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nom": lastName,
      "prenom": firstName,
      "mail": mail,
      "date_naissance": birthDate,
      "lieu_naissance": birthPlace,
      "genre": gender,
      "role": role,
      "mot_de_passe": /*RandomString.getRandomString(10)*/ "@zerty1234",
    };
  }

  Map<String, dynamic> toJsonWhithtouPassword() {
    return {
      "nom": lastName,
      "prenom": firstName,
      "mail": mail,
      "date_naissance": birthDate,
      "lieu_naissance": birthPlace,
      "genre": gender,
      "role": role,
    };
  }


}