
import 'package:gameoflife/cell.dart';
import "package:test/test.dart";

void main() {

  test("A living cell with less than two neighbors alives: Dies !",() {
    Cell cell = Cell(alive: true);
    List<List<Cell>> board = [
      [Cell(), Cell(), Cell()],
      [Cell(), cell, Cell()],
      [Cell(), Cell(), Cell()]
    ];

    cell.watchAround(board);

    expect(cell.alive, equals(false));
  });

  test("A living cell with two or three neighbors alives: Survives !",() {    
    Cell cell = Cell(alive: true);
    List<List<Cell>> board = [
      [Cell(), Cell(), Cell(alive: true)],
      [Cell(), cell, Cell(alive: true)],
      [Cell(), Cell(), Cell()]
    ];

    cell.watchAround(board);

    expect(cell.alive, equals(true));
  });

  test("A living cell with more than three neighbors alives: Dies !",() {
    Cell cell = Cell(alive: true);
    List<List<Cell>> board = [
      [Cell(), Cell(alive: true), Cell(alive: true)],
      [Cell(), cell, Cell(alive: true)],
      [Cell(), Cell(), Cell(alive: true)]
    ];

    cell.watchAround(board);

    expect(cell.alive, equals(false));
  });

  test("A dead cell with exactly three neighbors alives: Becomes alive !",() {
    Cell cell = Cell();
    List<List<Cell>> board = [
      [Cell(), Cell(), Cell(alive: true)],
      [Cell(), cell, Cell(alive: true)],
      [Cell(), Cell(), Cell(alive: true)]
    ];

    cell.watchAround(board);

    expect(cell.alive, equals(true));
  });
}