// Model MyWatchList
class MyWatchList {
  String title;
  String releaseDate;
  int rating;
  bool statusWatched;
  String review;

  MyWatchList(
      {required this.title,
      required this.releaseDate,
      required this.rating,
      required this.statusWatched,
      required this.review});

  factory MyWatchList.fromJson(Map<String, dynamic> json) => MyWatchList(
      title: json["fields"]["title"],
      releaseDate: json["fields"]["release_date"],
      rating: json["fields"]["rating"],
      statusWatched: json["fields"]["watched"],
      review: json["fields"]["review"]);

  Map<String, dynamic> toJson() => {
        "title": title,
      };
}
