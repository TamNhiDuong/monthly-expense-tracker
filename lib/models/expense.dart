class Expense {
  final String title;
  final double amount;
  final String category;
  final DateTime date;

  Expense(this.title, this.amount, this.category, this.date);

  Map<String, dynamic> toJson() => {
    'title': title,
    'amount': amount,
    'category': category,
    'date': date.toIso8601String(),
  };

  factory Expense.fromJson(Map json) {
    return Expense(
      json['title'],
      (json['amount'] as num).toDouble(),
      json['category'],
      DateTime.parse(json['date']),
    );
  }
}
