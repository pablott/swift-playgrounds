import Foundation


let dateString = "2021-10-22 16:22:31 +0000"

let dateFormatter = DateFormatter()
//dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
dateFormatter.dateFormat = "yyyy-MM-ddHH:mm:ssZ"
let date = dateFormatter.date(from:dateString)!
