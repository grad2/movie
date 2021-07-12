class Genres {
  int id;
  String name;

  Genres({required this.id, required this.name});

  Genres.fromJson(Map<String, dynamic> json)
      :
        id = json['id'],
        name = json['name'];

}