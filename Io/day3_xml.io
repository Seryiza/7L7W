OperatorTable addAssignOperator(":", "atPutNumber")

Map atPutNumber := method(
    self atPut(
        call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
        call evalArgAt(1)
    )
)
        
curlyBrackets := method(
    r := Map clone
    call message arguments foreach(arg, r doMessage(arg))
    r
)

Builder := Object clone

Builder intend := 0
Builder getIntend := method(" " repeated(self intend))
Builder addIntend := method(self intend := self intend + 2)
Builder removeIntend := method(self intend := self intend - 2)

Builder getAttributes := method(nodes,
    if (nodes first name != "curlyBrackets", return "")
    
    attributes := self doMessage(nodes first)
    joinedAttributes := attributes map(key, value, "#{key}=\"#{value}\"" interpolate) join(" ")
    return " " .. joinedAttributes
)

Builder forward := method(
    writeln(getIntend .. "<", call message name, getAttributes(call message arguments), ">")
    addIntend
    call message arguments foreach(
        arg,
        content := self doMessage(arg);
        if(content type == "Sequence", writeln(self getIntend .. content)))
    removeIntend
    writeln(getIntend .. "</", call message name, ">")
)

s := File with("day3_xml_data.txt") openForReading contents
doString(s)
