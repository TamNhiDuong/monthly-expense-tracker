# Deployed at: https://tamnhiduong.github.io/monthly-expense-tracker/

## To run it locally:
```sh
flutter run -d chrome
```

### Description
This app allows users to record and categorize monthly expenses using predefined categories.

Each category has a spending limit. When the total expenses exceed the limit, the category is highlighted in red.

### How to use
- Click the floating action button at the bottom right to add a new expense.
- Fill in the form and save. Data is stored locally using Hive.
- The home page shows all categories.
- Click a category to view all expenses belonging to it.
- Click on the statistic top right icon button to view the statistics.