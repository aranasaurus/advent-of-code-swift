import Foundation

var i = 0
for input in Inputs.one.split(separator: "\n") {
    let opp = input.first!
    let num = Int(String(input[input.index(after: input.startIndex)...])) ?? 0
    switch opp {
    case "+":
        i += num
    case "-":
        i -= num
    default: break
    }
}
i
