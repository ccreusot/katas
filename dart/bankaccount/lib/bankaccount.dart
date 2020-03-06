
class Account {
  final int balance;

  Account({this.balance = 0});

  Account deposit(int value) {
    if (value == 0) {
      throw ArgumentError("You can't deposit 0");
    } 
    if (value < 0) {
      throw ArgumentError("You can't deposit negative value");
    }
    return Account(balance: balance + value);
  }

  withdraw(int value) {
      throw ArgumentError("You can't withdraw negative value");
  }
}