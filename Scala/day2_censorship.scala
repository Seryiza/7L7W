trait Censor {
    val replacingWords = Map(
        "shoot" -> "pucky",
        "darn" -> "beans"
    )

    def censorText(text: String): String = {
        text
            .split(" ")
            .map(word => if replacingWords.contains(word) then replacingWords(word) else word)
            .mkString(" ")
    }
}

class MyCensorship extends Censor {}

@main def main() = {
    val input = "Oh my shoot it's darn"
    val censor = MyCensorship()
    println(censor.censorText(input))
}
