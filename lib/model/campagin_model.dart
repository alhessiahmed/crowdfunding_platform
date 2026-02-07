class campaignModel {
  final String id;
  final String title;
  final String description;
  final String image;
  final int raised;
  final int target;
  final String category;

  const campaignModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.raised,
    required this.target,
    required this.category,
  });
}