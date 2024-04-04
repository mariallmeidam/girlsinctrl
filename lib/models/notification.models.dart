class Notification {
  final String title;
  final String body;
  final Map<String, String> payload;

  Notification(
      {required this.title, required this.body, required this.payload});

  // Converte o objeto em um mapa
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'body': body,
      'payload': payload,
    };
  }

  // Converte o mapa em um objeto
  factory Notification.fromMap(Map<String, dynamic> map) {
    return Notification(
      title: map['title'],
      body: map['body'],
      payload: Map<String, String>.from(map['payload']),
    );
  }
}
