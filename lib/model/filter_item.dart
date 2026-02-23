
class FilterItem {
  final String id;
  final String title;
  final int count;
  final bool isLoading;

  const FilterItem({
    required this.id,
    required this.title,
    required this.count,
    this.isLoading = false,
  });
}


