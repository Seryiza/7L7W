val currentPositions = List(
    'X', 'O', 'X',
    'X', 'X', 'O',
    'X', 'O', 'O'
)

val totalCells = 9
val winningPositions = List(
    // Rows
    (0, 1, 2),
    (3, 4, 5),
    (6, 7, 8),

    // Cols
    (0, 3, 6),
    (1, 4, 7),
    (2, 5, 8),

    // Diagonals
    (0, 4, 8),
    (2, 4, 6)
)

def getGameState(positions: List[Char]): String = {
    if (isPlayerWinner('X', positions)) {
        return "X player won!"
    }

    if (isPlayerWinner('O', positions)) {
        return "O player won!"
    }

    if (isGameEnded(positions)) {
        return "Tie"
    }

    return "Game isn't ended."
}

def isPlayerWinner(symbol: Char, positions: List[Char]): Boolean = {
    val playerWinnerPositions = (symbol, symbol, symbol)
    return winningPositions
        .map(getGameCellsByPositions(_, positions))
        .contains(playerWinnerPositions)
}

def getGameCellsByPositions(selectingPositions: (Int, Int, Int), positions: List[Char]) = {
    // TODO: Refactor it
    val (a, b, c) = selectingPositions
    (positions(a), positions(b), positions(c))
}

def isGameEnded(positions: List[Char]): Boolean = {
    val currentFilledCells = positions.count(_ != ' ')
    return currentFilledCells == totalCells
}

@main def main() = {
    val gameState = getGameState(currentPositions)
    println(gameState)
}
