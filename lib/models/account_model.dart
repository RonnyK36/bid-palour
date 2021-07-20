class Account {
  String accountNumber;
  String ownerId;
  double balance;
  double availableWithdrawals;
  double winnings;
  int pendingPayments;
  int completedPayments;

  Account(
      {required this.accountNumber,
      required this.ownerId,
      required this.balance,
      required this.availableWithdrawals,
      required this.winnings,
      required this.pendingPayments,
      required this.completedPayments});
}
