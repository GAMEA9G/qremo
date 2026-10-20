class SyllabusPost {

  int? id;
  String? name;
 
  SyllabusPost({this.id, this.name});

  SyllabusPost.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
