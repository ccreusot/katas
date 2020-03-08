import 'package:bankaccount/bankaccount.dart';

class DateRepository implements DateProvider {
  @override
  DateTime current() {
    return DateTime.now();
  }
}

void main(List<String> arguments) {
  var account = Account(DateRepository());
  print(account.deposit(100).withdraw(20).printStatement());
}
