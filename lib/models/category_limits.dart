class CategoryLimit {
  final String name;
  final double limit;

  const CategoryLimit(this.name, this.limit);
}

const List<CategoryLimit> categoryLimits = [
  CategoryLimit("Food", 300),
  CategoryLimit("Groceries", 50),
  CategoryLimit("Eating out", 50),
  CategoryLimit("Housing", 1000),
  CategoryLimit("Transport", 50),
  CategoryLimit("Wellbeings", 50),
  CategoryLimit("Study", 100),
  CategoryLimit("Children", 100),
  CategoryLimit("Insurance", 45),
  CategoryLimit("Charity", 100),
  CategoryLimit("Health", 100),
  CategoryLimit("Entertainment", 50),
];
