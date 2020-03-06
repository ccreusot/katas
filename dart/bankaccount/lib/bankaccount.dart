
class Account {
  void deposit(int value) {
    throw ArgumentError("You can't deposit negative value");
  }
}