
class Cell {
  bool alive;

  Cell({this.alive = false});

  void watchAround(List<List<Cell>> board) {
    int x;
    int y;

    // first find position
    for (y = 0; y < board.length; y++) {
      bool shouldBreak = false;
      for (x = 0; x < board[y].length; x++) {
        if (board[y][x] == this) {
          shouldBreak = true;
          break;
        }
      }
      if (shouldBreak) {
        break;
      }
    }

    // check each cell around in cross +
    Cell top = (y - 1 >= 0) ? board[y - 1][x] : null;
    Cell left = (x - 1 >= 0) ? board[y][x - 1] : null;
    Cell right = (x + 1 < board[y].length) ? board[y][x + 1] : null;
    Cell bottom = (y + 1 < board.length) ? board[y + 1][x] : null;

    // check each cell around in cross x
    Cell topLeft = (top != null && left != null) ? board[y - 1][x - 1] : null;
    Cell topRight = (top != null && right != null) ? board[y - 1][x + 1] : null;
    Cell bottomLeft = (bottom != null && left != null) ? board[y + 1][x - 1] : null;
    Cell bottomRight = (bottom != null && right != null) ? board[y + 1][x + 1] : null;

    List<Cell> cellsAround = [topLeft, top, topRight, left, right, bottomLeft, bottom, bottomRight];
    int nbAliveCells = cellsAround.where((Cell cell) => cell.alive).length;

    if (nbAliveCells < 2 || nbAliveCells > 3) {
      alive = false;
    } else if (nbAliveCells == 3) {
      alive = true;
    }
  }
}