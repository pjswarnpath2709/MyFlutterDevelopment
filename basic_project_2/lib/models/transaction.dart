class Transaction {
  String id;
  String tittle;
  double amount;
  DateTime date;

  Transaction({
    required this.tittle,
    required this.amount,
    required this.date,
    required this.id,
  });
}
