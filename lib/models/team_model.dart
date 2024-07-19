// ignore_for_file: public_member_api_docs, sort_constructors_first
class TeamModel {
  String? name;
  int? age;
  String? profession;

  TeamModel({this.name, this.age, this.profession});

  TeamModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String;
    age = json['age'] as int;
    profession = json['profession'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['age'] = age;
    data['profession'] = profession;
    return data;
  }

  @override
  String toString() =>
      'TeamModel(name: $name, age: $age, profession: $profession)';
}
