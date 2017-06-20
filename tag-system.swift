import Foundation

struct TagSystem {
    let production_rules: Dictionary<Character, String>
    let deletion_number: Int
    let halt_symbol: Character?

    init(production_rules: Dictionary<Character, String>, deletion_number: Int) {
        self.production_rules = production_rules
        self.deletion_number = deletion_number
        self.halt_symbol = nil
    }
}

// Returns None() on a halt state. If a halt_symbol isn't provided,
// then step() assumes that words of length less than the deletion_number
// are halt states. It also halts if a production rule isn't in the production_rules dictionary
func step(_ tag_system: TagSystem, _ input: String) -> String? {
    let first_char: Character = input[input.startIndex]

    if first_char == tag_system.halt_symbol {
        return nil // Halt symbol reached
    }
    
    if input.utf16.count < tag_system.deletion_number {
            return nil
    }

    if let append = tag_system.production_rules[first_char] {
        // Remove the first "deletion_number"th characters from input
        let index = input.index(input.startIndex, offsetBy: tag_system.deletion_number)
        let deleted = input.substring(from: index)
        return String(deleted) + append
    }

    return nil
}

func execute(_ tag_system: TagSystem, _ input: inout String?) {
    while input != nil {
        print(input!)
        input = step(tag_system, input!)
    }
}

for i in 1...10 {

var input_collatz: String? = String(repeating: "A", count:  i)

let collatz = TagSystem(production_rules: ["A": "bz", "b": "A", "z": "AAA"], deletion_number: 2)

execute(collatz, &input_collatz)
}
// var input: String? = "acbcbacbccacbcbcacbbb"

// let simple = TagSystem(production_rules: ["a": "ccbaH", "b": "cca", "c": "cc"], deletion_number: 2)

// execute(simple, &input)