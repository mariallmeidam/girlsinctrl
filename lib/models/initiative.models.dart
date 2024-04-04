// ignore_for_file: public_member_api_docs, sort_constructors_first
class Initiative {
  int? id;
  String? name;
  String? subtitle;
  String? link;
  String? image;

  Initiative({
    this.id,
    this.name,
    this.subtitle,
    this.link,
    this.image,
  });

  factory Initiative.fromJson(Map<String, dynamic> json) {
    return Initiative(
      id: json['id'],
      name: json['name'],
      subtitle: json['subtitle'],
      link: json['link'],
      image: json['image'],
    );
  }
}
