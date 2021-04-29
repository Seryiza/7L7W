Number div := Number getSlot("/")
Number / := method(denom, if(denom == 0, 0, self div(denom)))

2 / 0 println
2 / 2 println
