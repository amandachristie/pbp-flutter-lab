// Model Budget
class Budget {
  static List<Budget> budgets = [];
  String name;
  int amount;
  String type;
  DateTime date;

  Budget({
    required this.name,
    required this.amount,
    required this.type,
    required this.date,
  });

  static void addBudget({
    required name,
    required amount,
    required type,
    required date,
  }) {
    budgets.add(Budget(
      name: name,
      amount: amount,
      type: type,
      date: date,
    ));
  }
}
