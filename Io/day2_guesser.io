guessIntegerNumber := method(min, max, Random value(min, max + 1) floor)
getPlayerNumber := method(File standardInput readLine asNumber)

win := method("Да, верно!" println; System exit)

"Компьютер загадал число, попробуйте его угадать :)" println
guessedNumber := guessIntegerNumber(1, 100)
for(currentTry, 1, 10,
    playerNumber := getPlayerNumber
    if(playerNumber == guessedNumber) then(win)

    if(playerNumber < guessedNumber) \
    then("Загаданное число больше" println) \
    else("Загаданное число меньше" println)
)

"Не угадал :( Компьютер загадал " with(guessedNumber asString) println
