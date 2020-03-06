import 'package:bankaccount/bankaccount.dart';
import 'package:test/test.dart';

// Write a class Account that offers the following methods void deposit(int) void withdraw(int) String printStatement()

void main() {
  test('deposit negative number should throw an invalid argument exception', () {
    Account account = Account();

    expect(() => account.deposit(-1), throwsA(
      isA<ArgumentError>().having(
        (error) => error.message,
        "message",
        "You can't deposit negative value")));
  });

  test('deposit 0 should throw an invalid argument exception', () {
    Account account = Account();

    expect(() => account.deposit(0), throwsA(
      isA<ArgumentError>().having(
        (error) => error.message,
        "message",
        "You can't deposit 0")));
  });
}
