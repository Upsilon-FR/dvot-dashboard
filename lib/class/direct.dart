class Direct {
  String? id;
  String title;
  String description;
  String link;
  String date;
  String author;
  bool live;
  int spectators;

  Direct(
      {this.id,
      required this.title,
      required this.description,
      required this.link,
      required this.date,
      required this.author,
      required this.live,
      required this.spectators});

  Map<String, dynamic> toJson(){
    return{
      "titre": title,
      "description": description,
      "date": date,
      "auteur": author,
      "lien": link,
    };
  }


  factory Direct.fromJson(Map<String, dynamic> json) {
    return Direct(
      id: json["id"] as String,
      title: json["titre"] as String,
      description: json["description"] as String,
      link: json["lien"] as String,
      date: json["date"] as String,
      author: json["auteur"] as String,
      live: json["live"] as bool,
      spectators: json["spectateurs"] as int,
    );
  }
}
