
class Account {
  Account deposit(int value) {
    if (value == 0) {
      throw ArgumentError("You can't deposit 0");
    } 
    if (value < 0) {
      throw ArgumentError("You can't deposit negative value");
    }
    return Account();
  }

  int balance() {
    return 1;
  }
}