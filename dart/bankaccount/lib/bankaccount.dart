
class Account {
  void deposit(int value) {
    if (value == 0) {
      throw ArgumentError("You can't deposit 0");
    }
    throw ArgumentError("You can't deposit negative value");
  }
}