import 'package:gameoflife/board.dart';

import 'cell.dart';

class Game {
  final Board board;
  bool _endReached = false;

  Game({this.board}) {
    ArgumentError.checkNotNull(this.board, "board");
  }

  void update() {
    Iterable<Cell> cells = board.cells.expand((List<Cell> row) => row);
    cells.forEach((Cell cell) {
      cell.watchAround(board.cells);
    });
    _endReached = cells.where((Cell cell) => cell.alive).isEmpty;
  }

  bool isEndReached() => _endReached;
}
