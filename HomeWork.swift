struct Stack {
    private var sequenceOfOpenBracket = ""
    private var indexes = [Int]()
    mutating func push(indexOfBracket: Int, bracket: Character){
        sequenceOfOpenBracket.append(bracket)
        indexes.append(indexOfBracket)
    }
    mutating func pop() -> (Character?, Int?){
        if sequenceOfOpenBracket.isEmpty{
            return (nil, nil)
        } else {
            return (sequenceOfOpenBracket.removeLast(), indexes.removeLast())
        }
    }
}

func checkBrackets(string: String) -> Int {
    var myStack = Stack()
    let defaultResult = -1 
    let notArrayIndex = 1
    let openBrackets = "{(["
    let closeBrackets = "})]"
    for (symbolIndex, symbol) in string.enumerated(){
        if openBrackets.contains(symbol){
            myStack.push(indexOfBracket: symbolIndex, bracket: symbol)
        } else if closeBrackets.contains(symbol){
            let (lastOpenBracket, _) = myStack.pop()
            switch lastOpenBracket {
            case "{":
                if symbol != "}"{
                    return symbolIndex+notArrayIndex
                }
            case "(":
                if symbol != ")"{
                    return symbolIndex+notArrayIndex
                }
             case "[":
                if symbol != "]"{
                    return symbolIndex+notArrayIndex
                }
            default:
                return symbolIndex+notArrayIndex
            }     
        }
    }
    let (_, lastOpenBracketIndex) = myStack.pop()
    if lastOpenBracketIndex == nil{
        return defaultResult
    }
    return lastOpenBracketIndex!+notArrayIndex
}
