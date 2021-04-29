List myAverage := method(
    if(self size == 0) ifTrue(return nil)

    if(self select(n, n asNumber isNan) size != 0) ifTrue(
        Exception raise("List contains not a number.")
    )

    sum := self reduce(sum, n, sum + n)
    sum / (self size)
)

"It should be 2" println
list(1, 2, 3) myAverage println

"It should be nil" println
list() myAverage println

"It should raise an exception" println
list(1, 2, "Hello") myAverage println
