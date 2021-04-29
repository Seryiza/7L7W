List sum := method(
    sum := 0
    self foreach(v, sum := sum + v)
    sum
)

// Answer is 45
array := list(
    list(1, 2, 3),
    list(4, 5, 6),
    list(7, 8, 9)
)

array map(sum) sum println
