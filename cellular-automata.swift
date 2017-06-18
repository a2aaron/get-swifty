let iters = 10000
// let rule = [false, false, false, true, true, true, true, false]

// I use a dictionary here because most rules result in not all the
// spaces being filled. This depends on the exact rule, but it's likely that
// less that half will be filled given a random row and random rule, 
// so it's probably ok do this. Also this makes centering the row around zero much easier
var row = [Int: Bool]()

extension Dictionary {
    func get<T>(_ key: Key, defaultValue: T) -> T {
        // if the key-value pair exists and can be a T return the value
        if let value = self[key] as? T {
            return value
        }
        return defaultValue
    }
}

func right_pad(_ string: String, _ num_spaces: Int) -> String {
    let length = string.utf16.count
    let count = (num_spaces - length) / 2
    return String(repeating: " ", count: count) + string
}

row[0] = true
print(right_pad("T", 1 + (iters * 2)))
for i in 0..<iters {
    var next_row = [Int: Bool]()
    var row_string = ""
    // must do plus one because we want to iterate one more cell than last time
    for j in -(i + 1)...(i + 1) {
        let left = row.get(j - 1, defaultValue: false)
        let center = row.get(j, defaultValue: false)
        let right = row.get(j + 1, defaultValue: false)

        // rule 30: (left && !(center || right)) || (!left && (center || right))
        // rule 90: (left != right) && !center
        if ((left && !(center || right)) || (!left && (center || right))) {
            next_row[j] = true
            row_string += "T"
        } else {
            row_string += " "
        }
    }
    row = next_row
    print(right_pad(row_string, 1 + (iters * 2)))
}