import 'account_model.dart';

class AppUser {
  String name;
  Account account;
  double balance;
  int phone;

  AppUser(
      {required this.name,
      required this.account,
      required this.balance,
      required this.phone});
}
