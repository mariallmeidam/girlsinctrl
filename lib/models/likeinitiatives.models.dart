import 'package:flutter/material.dart';

class Like_initiatives {
  int? id;
  int? user_id;
  String? name;
  String? subtitle;
  String? link;
  String? image;

  Like_initiatives({
    this.id,
    this.user_id,
    this.name,
    this.subtitle,
    this.link,
    this.image,
  });

  // transforma os valores da tabela em um objeto json

  factory Like_initiatives.fromJson(Map<String, dynamic> json) {
    return Like_initiatives(
      id: json['id'],
      user_id: json['user_id'],
      name: json['name'],
      subtitle: json['subtitle'],
      link: json['link'],
      image: json['image'],
    );
  }
}
