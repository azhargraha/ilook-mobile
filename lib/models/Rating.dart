class Rating {
  final double rating;
  final int totalRatingCount;
  final Map ratingDetails;

  const Rating(
      {required this.rating,
      required this.totalRatingCount,
      required this.ratingDetails});

  String showRating() {
    RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
    return this.rating.toStringAsFixed(1).replaceAll(regex, '');
  }

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
        rating: json['rating'],
        totalRatingCount: json['totalRatingCount'],
        ratingDetails: json['ratingDetails']);
  }
}
