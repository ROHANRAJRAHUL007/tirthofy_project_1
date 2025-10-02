class Destination {
  final String name;
  final String subtitle;
  final List<String> tags;
  final String imageUrl;
  final bool isTrending;

  Destination({
    required this.name,
    required this.subtitle,
    required this.tags,
    required this.imageUrl,
    this.isTrending = false,
  });
}
