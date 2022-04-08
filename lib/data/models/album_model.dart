class Album {
  final int? id;
  final int? userId;
  final String? title;
  final String? body;

  const Album({this.id, this.userId, this.title, this.body});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}
