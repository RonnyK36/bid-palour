import 'account_model.dart';

class AppUser {
  String name;
  Account account;
  double balance;

  AppUser({required this.name, required this.account, required this.balance});
}
