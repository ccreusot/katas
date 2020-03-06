import 'package:bankaccount/bankaccount.dart';
import 'package:test/test.dart';

// Write a class Account that offers the following methods void deposit(int) void withdraw(int) String printStatement()

void main() {
  test('deposit negative number should throw an invalid argument exception',
      () {
    var account = Account();

    expect(
        () => account.deposit(-1),
        throwsA(isA<ArgumentError>().having((error) => error.message, "message",
            "You can't deposit negative value")));
  });

  test('deposit 0 should throw an invalid argument exception', () {
    var account = Account();

    expect(
        () => account.deposit(0),
        throwsA(isA<ArgumentError>().having(
            (error) => error.message, 'message', "You can't deposit 0")));
  });

  test('deposit positive value should return new Account with positive balance',
      () {
    var account = Account();

    var newAccount = account.deposit(1);

    expect(newAccount.balance, 1);
  });

  test('deposit 10 then 100 should return new Account with 110 for balance',
      () {
    var account = Account();

    var newAccount = account.deposit(10).deposit(100);

    expect(newAccount.balance, 110);
  });

  test('withdraw negative number should throw an invalid argument exception',
      () {
    var account = Account();

    expect(
        () => account.withdraw(-1),
        throwsA(isA<ArgumentError>().having((error) => error.message, "message",
            "You can't withdraw negative value")));
  });

  test('withdraw 0 should throw an invalid argument exception', () {
    var account = Account();

    expect(
        () => account.withdraw(0),
        throwsA(isA<ArgumentError>().having(
            (error) => error.message, "message", "You can't withdraw 0")));
  });

  test(
      'withdraw positive value should return new Account with negative balance',
      () {
    var account = Account();

    var newAccount = account.withdraw(10);

    expect(newAccount.balance, -10);
  });

  test('printStatement without statement deposit', () {
    var account = Account();

    var statement = account.printStatement();

    expect(statement, '''
    Date\t\t\t\tAmount\t\t\t\tBalance
        \t\t\t\t      \t\t\t\t0
    ''');
  });

  test(
      'printStatement after a deposit should show the date of the deposit and the value given and the current balance',
      () {
    var account = Account();

    var statement = account.deposit(500).printStatement();

    var currentDate = DateTime.now();

    expect(statement, '''
    Date\t\t\t\tAmount\t\t\t\tBalance
    ${currentDate.day}.${currentDate.month}.${currentDate.year}\t\t\t\t500\t\t\t\t500
    ''');
  });
}
