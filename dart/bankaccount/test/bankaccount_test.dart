import 'package:bankaccount/bankaccount.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

// Write a class Account that offers the following methods void deposit(int) void withdraw(int) String printStatement()
// Make it sure that when we're depositing or withdrawing we're using a date provider to get the current date.

class MockDateProvider extends Mock implements DateProvider {}

void main() {
  var dateProvider;
  var account;
  setUp(() {
    dateProvider = MockDateProvider();
    account = Account(dateProvider);
  });

  test('deposit negative number should throw an invalid argument exception',
      () {
    expect(
        () => account.deposit(-1),
        throwsA(isA<ArgumentError>().having((error) => error.message, 'message',
            "You can't deposit negative value")));
  });

  test('deposit 0 should throw an invalid argument exception', () {
    expect(
        () => account.deposit(0),
        throwsA(isA<ArgumentError>().having(
            (error) => error.message, 'message', "You can't deposit 0")));
  });

  test('withdraw negative number should throw an invalid argument exception',
      () {
    expect(
        () => account.withdraw(-1),
        throwsA(isA<ArgumentError>().having((error) => error.message, 'message',
            "You can't withdraw negative value")));
  });

  test('withdraw 0 should throw an invalid argument exception', () {
    expect(
        () => account.withdraw(0),
        throwsA(isA<ArgumentError>().having(
            (error) => error.message, 'message', "You can't withdraw 0")));
  });

  test('printStatement without statement deposit', () {
    var statement = account.printStatement();

    expect(statement, '''
    Date\t\t\t\tAmount\t\t\t\tBalance
        \t\t\t\t      \t\t\t\t0
    ''');
  });

  test(
      'printStatement after a deposit and withdraw should show the date of the deposits and the values given and the current balance for each operations',
      () {
    when(dateProvider.current()).thenReturn(DateTime.utc(2019, 2, 2));
    var newAccount = account.deposit(500);
    when(dateProvider.current()).thenReturn(DateTime.utc(2019, 6, 24));
    newAccount = newAccount.withdraw(100);
    when(dateProvider.current()).thenReturn(DateTime.utc(2020, 1, 29));
    newAccount = newAccount.deposit(200);
    var statement = newAccount.printStatement();

    expect(statement, '''
    Date\t\t\t\tAmount\t\t\t\tBalance
    2.2.2019\t\t\t\t500\t\t\t\t500
    24.6.2019\t\t\t\t-100\t\t\t\t400
    29.1.2020\t\t\t\t200\t\t\t\t600
    ''');
  });
}
