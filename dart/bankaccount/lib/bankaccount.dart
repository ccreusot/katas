class Account {
  final List<Transaction> transactions;

  int get balance =>
      transactions.fold(0, (previous, current) => previous + current.value);

  Account({this.transactions = const []});

  Account deposit(int value) {
    if (value == 0) {
      throw ArgumentError("You can't deposit 0");
    }
    if (value < 0) {
      throw ArgumentError("You can't deposit negative value");
    }
    var newList = List.of(transactions);
    newList.add(Transaction(value));
    return Account(transactions: newList);
  }

  Account withdraw(int value) {
    if (value == 0) {
      throw ArgumentError("You can't withdraw 0");
    }
    if (value < 0) {
      throw ArgumentError("You can't withdraw negative value");
    }
    var newList = List.of(transactions);
    newList.add(Transaction(-value));
    return Account(transactions: newList);
  }

  String printStatement() {
    var currentDate = DateTime.now();
    if (transactions.isEmpty) {
      return '''
    Date\t\t\t\tAmount\t\t\t\tBalance
        \t\t\t\t      \t\t\t\t$balance
    ''';
    }
    return '''
    Date\t\t\t\tAmount\t\t\t\tBalance
    ${currentDate.day}.${currentDate.month}.${currentDate.year}\t\t\t\t$balance\t\t\t\t$balance
    ''';
  }
}

class Transaction {
  final DateTime date = DateTime.now();
  final int value;

  Transaction(this.value);
}
