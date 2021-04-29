fib := method(n, if(n == 0 or n == 1, n, fib(n-1) + fib(n-2)))

fib(4) println
fib(10) println

fib := method(
    n,
    f1 := 0
    f2 := 1
    for (i, 1, n,
        tmp := f2
        f2 := f1 + f2
        f1 := tmp
    )
    f1
)

fib(4) println
fib(10) println
