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

  Account withdraw(int value) {
    if (value == 0) {
      throw ArgumentError("You can't withdraw 0");
    }
    if (value < 0) {
      throw ArgumentError("You can't withdraw negative value");
    }
    return Account(balance: balance - value);
  }

  String printStatement() {
    var currentDate = DateTime.now();
    return '''
    Date\t\t\t\tAmount\t\t\t\tBalance
    ${currentDate.day}.${currentDate.month}.${currentDate.year}\t\t\t\t$balance\t\t\t\t$balance
    ''';
  }
}
