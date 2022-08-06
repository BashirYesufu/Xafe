class BudgetViewModel {
  String title;
  double totalBudget;
  double spentBudget;
  String period;
  List transactions;

  BudgetViewModel({
    required this.title,
    required this.totalBudget,
    required this.spentBudget,
    required this.period,
    this.transactions = const [],
});
}