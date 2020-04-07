import 'dart:math';

import 'package:gameoflife/cell.dart';

class Board {
  List<List<Cell>> _board;
  final int width;
  final int height;

  Board(this.width, this.height, this._board);

  Board.randomized(this.width, this.height) {
    this._board = List<List<Cell>>(height);
    for (int y = 0; y < height; y++) {
      cells[y] = List<Cell>(width);
      for (int x = 0; x < width; x++) {
        Random randomizer = Random();
        cells[y][x] = Cell(alive: randomizer.nextBool());
      }
    }
  }

  List<List<Cell>> get cells => this._board;
}
