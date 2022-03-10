import Foundation

extension String {
    func splitInGroups(groupCount: Int, separator: String) -> String {
        let result = self as NSString
        
        let numberOfGroups: Int = Int(ceil(Double(result.length) / Double(groupCount)))
        var groupsArray: [String] = []
        
        print("numberOfGroups", numberOfGroups)
                
        for groupIndex in stride(from: 0, to: numberOfGroups, by: 1) {
            let startIndex = groupIndex * groupCount
            let groupLenght = min(groupCount, result.length - startIndex)
            print("startPosition", startIndex)
            
            let range = NSRange(location: startIndex, length: groupLenght)
            print("range", range)
            
            let group = result.substring(with: range)
            print("group", group)
            
            groupsArray.append(group)
            print("---")
        }
        
        print("groupsArray", groupsArray)
        let formattedString = groupsArray.joined(separator: separator)
        return formattedString
    }
}

let code = "1234567890123456789012"
let formattedCode = code.splitInGroups(groupCount: 4, separator: "-")
formattedCode


code.count
let numberOfGroups = Double(code.count) / 4
type(of: numberOfGroups)
