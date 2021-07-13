@main def main() = {
    val texts = List(
        "hello, world!",
        "hmm",
        "..."
    )

    val totalLength = texts.foldLeft(0)((length, text) => length + text.length)
    println(totalLength)
}
