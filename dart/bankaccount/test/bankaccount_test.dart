import 'package:bankaccount/bankaccount.dart';
import 'package:test/test.dart';

// Write a class Account that offers the following methods void deposit(int) void withdraw(int) String printStatement()

void main() {
  test('deposit negative number should throw an invalid argument exception',
      () {
    Account account = Account();

    expect(
        () => account.deposit(-1),
        throwsA(isA<ArgumentError>().having((error) => error.message, "message",
            "You can't deposit negative value")));
  });

  test('deposit 0 should throw an invalid argument exception', () {
    Account account = Account();

    expect(
        () => account.deposit(0),
        throwsA(isA<ArgumentError>().having(
            (error) => error.message, "message", "You can't deposit 0")));
  });

  test('deposit positive value should return new Account with positive balance',
      () {
    Account account = Account();

    Account newAccount = account.deposit(1);

    expect(newAccount.balance, 1);
  });

  test('deposit 10 then 100 should return new Account with 110 for balance',
      () {
    Account account = Account();

    Account tmp = account.deposit(10);
    Account newAccount = tmp.deposit(100);

    expect(newAccount.balance, 110);
  });

  test('withdraw negative number should throw an invalid argument exception',
      () {
    Account account = Account();

    expect(
        () => account.withdraw(-1),
        throwsA(isA<ArgumentError>().having((error) => error.message, "message",
            "You can't withdraw negative value")));
  });
}
