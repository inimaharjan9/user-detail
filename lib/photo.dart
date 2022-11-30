class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

      factory Photo.fromJson(Map<String, dynamic> json){
        return Photo(id: json['id'],
        albumId: json['albumId'],
        title: json['title'],
        url: json['url'],
        thumbnailUrl: json['thumbnailUrl'],
        );
}

List<Photo> photos = [
  Photo(
    albumId: 1,
    id: 1,
    title: "accusamus beatae ad facilis cum similique qui sunt",
    url: "https://via.placeholder.com/600/92c952",
    thumbnailUrl:
        "https://cdn.pixabay.com/photo/2022/11/19/10/03/rose-7601741_1280.jpg",
  ),
  Photo(
    albumId: 1,
    id: 2,
    title: "reprehenderit est deserunt velit ipsam",
    url: "https://via.placeholder.com/600/771796",
    thumbnailUrl:
        "https://cdn.pixabay.com/photo/2013/07/21/13/00/rose-165819_1280.jpg",
  )
];
