class Destination {
  final String name;
  final String image;

  Destination({required this.name, required this.image});

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      name: json['name'] as String,
      image: json['image'] as String,
    );
  }
}
