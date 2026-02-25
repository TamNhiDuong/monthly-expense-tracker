class CategoryLimit {
  final String name;
  final double limit;

  const CategoryLimit(this.name, this.limit);
}

const List<CategoryLimit> categoryLimits = [
  CategoryLimit("Food", 200),
  CategoryLimit("Groceries", 50),
  CategoryLimit("Eating out", 50),
  CategoryLimit("Mortgage", 550),
  CategoryLimit("Transport", 50),
  CategoryLimit("Beauty", 50),
  CategoryLimit("Clothes", 0),
  CategoryLimit("Study", 0),
  CategoryLimit("Children", 100),
  CategoryLimit("Insurance", 45),
  CategoryLimit("Charity", 100),
  CategoryLimit("Hoitovastike", 405),
  CategoryLimit("Health", 0),
  CategoryLimit("Entertainment", 0),
];
