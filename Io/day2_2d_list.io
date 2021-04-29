List2D := List clone do(
    dim := method(x, y, self setSize(y) map(list() setSize(x)))
    set := method(x, y, value, self at(y) atPut(x, value))
    get := method(x, y, self at(y) at(x))

    height := method(self size)
    width := method(self first size)
    foreachitem := method(
        for(x, 0, self width - 1,
            for (y, 0, self height - 1,
                call sender setSlot(call argAt(0) name, x)
                call sender setSlot(call argAt(1) name, y)
                call sender setSlot(call argAt(2) name, self get(x, y))
                call sender doMessage(call argAt(3))
            )
        )
    )

    transpose := method(
        transposed := List2D clone dim(self height, self width)
        self foreachitem(x, y, value, transposed set(y, x, value))
        transposed
    )
)

list2d := List2D clone dim(1, 2)
list2d set(0, 1, "Hello!")
"Should be Hello" println
list2d get(0, 1) println

list2d := List2D clone dim(2, 3)
list2d set(0, 0, 1)
list2d set(1, 0, 2)
list2d set(0, 1, 3)
list2d set(1, 1, 4)
list2d set(0, 2, 5)
list2d set(1, 2, 6)

"Source matrix:" println
list2d println

"Transposed matrix:" println
list2d transpose println
