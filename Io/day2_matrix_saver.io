matrix := list(
    list(1, 2, 3),
    list(4, 5, 6)
)

file := File with("matrix") remove openForUpdating
file write(matrix serialized) close

matrix := doFile("matrix")
matrix println
