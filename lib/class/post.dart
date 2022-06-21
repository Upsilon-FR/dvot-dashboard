class Post {
  final String? id;
  final String title;
  final String description;
  final String dateCreation;
  final String dateVote;
  final String etat;
  final String? lienVideo;
  final String? documents;

  Post({this.id, required this.title, required this.description, required this.dateCreation,
    required this.dateVote, required this.etat, this.lienVideo, this.documents});


  Map<String, dynamic> toJson() {
    return {
      "titre": title,
      "description": description,
      "date_creation": dateCreation,
      "date_vote": dateVote,
      "etat": etat
    };
  }


  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json["id"] as String,
        title: json["titre"] as String,
        description: json["description"] as String,
        dateCreation: json["date_creation"] as String,
        dateVote: json["date_vote"] as String,
        etat: json["etat"] as String,
    );
  }
}