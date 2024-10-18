class Photo {
  int albumId = 0;
  int id = 0;
  String title = '';
  String url = '';
  String thumbnailUrl = '';

  Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  // factory Photo.fromeJson(Map<String, dynamic> map) {
  //   return Photo(
  //       albumId: map[0],
  //       id: map['id'],
  //       title: map['title'],
  //       url: map['url'],
  //       thumbnailUrl: map['thumbnailUrl']);
  // }
}
