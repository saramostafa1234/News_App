import 'dart:ui';

class CategoryData {
  final String categoryId;
  final String categoryName;
  final String categoryIcon;
  final Color categoryBackgroundColor;

  CategoryData(
      {required this.categoryBackgroundColor,
      required this.categoryIcon,
      required this.categoryId,
      required this.categoryName});
}
