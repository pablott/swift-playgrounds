import Foundation

func generateRandomNonDuplicatedArray(range: ClosedRange<Int>, count: Int) -> [Int] {
    var resultArray = Array(range)
    
    for i in stride(from: resultArray.count - 1, to: resultArray.count - count - 1, by: -1) {
        let randomIndex = Int.random(in: 0...i)
        resultArray.swapAt(i, randomIndex)
    }
    
    return Array(resultArray.suffix(count))
}

let numberOfRandomNumbers = 5
let maxNumber = 10
let randomNumbers = generateRandomNonDuplicatedArray(range: 1...maxNumber, count: numberOfRandomNumbers)

print("Random non-duplicated numbers between 1 and \(maxNumber):")
print(randomNumbers)
