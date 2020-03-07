class Account {
  final List<Transaction> transactions;
  final DateProvider _dateProvider;

  int get balance =>
      transactions.fold(0, (previous, current) => previous + current.value);

  Account(this._dateProvider, {this.transactions = const []});

  Account deposit(int value) {
    if (value == 0) {
      throw ArgumentError("You can't deposit 0");
    }
    if (value < 0) {
      throw ArgumentError("You can't deposit negative value");
    }
    var newList = List.of(transactions);
    newList.add(Transaction(_dateProvider.current(), value));
    return Account(_dateProvider, transactions: newList);
  }

  Account withdraw(int value) {
    if (value == 0) {
      throw ArgumentError("You can't withdraw 0");
    }
    if (value < 0) {
      throw ArgumentError("You can't withdraw negative value");
    }
    var newList = List.of(transactions);
    newList.add(Transaction(_dateProvider.current(), -value));
    return Account(_dateProvider, transactions: newList);
  }

  String printStatement() {
    var balance = 0;
    if (transactions.isEmpty) {
      return '''
    Date\t\t\t\tAmount\t\t\t\tBalance
        \t\t\t\t      \t\t\t\t$balance
    ''';
    }
    var transactionStatements = <String>[];
    for (var transaction in transactions) {
      balance += transaction.value;
      transactionStatements.add("${transaction.date.day}.${transaction.date.month}.${transaction.date.year}\t\t\t\t${transaction.value}\t\t\t\t$balance");
    }
    return '''
    Date\t\t\t\tAmount\t\t\t\tBalance${transactionStatements.fold("", (previous, current) => previous + "\n    " + current)}
    ''';
  }
}

class Transaction {
  final DateTime date;
  final int value;

  Transaction(this.date, this.value);
}

abstract class DateProvider {
  DateTime current();
}