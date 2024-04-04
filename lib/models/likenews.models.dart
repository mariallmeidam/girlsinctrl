class Like_news {
  int? id;
  int? user_id;
  String? title;
  String? description;
  String? link;
  String? image;
  String? icon;

  Like_news({
    this.id,
    this.user_id,
    this.title,
    this.description,
    this.link,
    this.image,
    this.icon,
  });

  // transforma os valores da tabela em um objeto json

  factory Like_news.fromJson(Map<String, dynamic> json) {
    return Like_news(
      id: json['id'],
      user_id: json['user_id'],
      title: json['title'],
      description: json['description'],
      link: json['link'],
      image: json['image'],
      icon: json['icon'],
    );
  }
}
