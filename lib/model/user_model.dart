class User {
  String? name;
  String? surname;
  String? age;
  String? id;

  User({this.name, this.surname, this.age, this.id});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
    age = json['age'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['age'] = this.age;
    data['id'] = this.id;
    return data;
  }
}