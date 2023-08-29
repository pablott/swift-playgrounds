import Foundation

func generateRandomNonDuplicatedArray(range: ClosedRange<Int>, count: Int) -> [Int] {
    var randomNumbers = Set<Int>()
    
    while randomNumbers.count < count {
        let randomNumber = Int.random(in: range)
        randomNumbers.insert(randomNumber)
    }
    
    return Array(randomNumbers)
}

let numberOfRandomNumbers = 6
let maxNumber = 10
let randomNumbers = generateRandomNonDuplicatedArray(range: 1...maxNumber, count: numberOfRandomNumbers)

print("Random non-duplicated numbers between 1 and \(maxNumber):")
print(randomNumbers)
