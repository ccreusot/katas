import 'package:gameoflife/board.dart';
import 'package:gameoflife/cell.dart';
import 'package:gameoflife/game.dart';
import 'package:test/test.dart';

void main() {
  test("A Game should have a board, if not it should throw an error", () {
    try {
      Game(board: null);
    } catch (e) {
      expect(e, isArgumentError);
    }
  });

  test("A Game should still run when cells are still alive", () {
    Game game = Game(
        board: Board(3, 3, [
      [Cell(), Cell(), Cell()],
      [Cell(alive: true), Cell(alive: true), Cell()],
      [Cell(), Cell(alive: true), Cell(alive: true)],
    ]));

    game.update();
    bool endReached = game.isEndReached();

    expect(endReached, false);
  });

  test("A Game end when all the cell are dead", () {
    Game game = Game(
        board: Board(3, 3, [
      [Cell(), Cell(), Cell()],
      [Cell(), Cell(), Cell()],
      [Cell(), Cell(), Cell(alive: true)],
    ]));

    game.update();
    bool endReached = game.isEndReached();

    expect(endReached, true);
  });
}
