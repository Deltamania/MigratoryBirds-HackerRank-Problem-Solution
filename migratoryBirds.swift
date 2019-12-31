import Foundation

// Complete the migratoryBirds function below.
func migratoryBirds(arr: [Int]) -> Int {
    var birds: [Int: Int] = [:]
    arr.forEach { birds[$0] = (birds[$0] ?? 0) + 1 }
    return birds.filter {$0.1 == birds.values.max() }.keys.min() ?? 0

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let arrCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let arrTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == arrCount else { fatalError("Bad input") }

let result = migratoryBirds(arr: arr)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
