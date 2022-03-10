import Foundation

extension Date {
    var shortDateFormat: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY.MM.dd"
        
        return formatter.string(from: self)
    }
}

let now = Date()
now.shortDateFormat


extension Date {
    static func dateFromString(_ input: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
//        formatter.calendar = Calendar(identifier: .iso8601)
//        formatter.locale = Locale(identifier: "en_US_POSIX")
//        formatter.timeZone = TimeZone(secondsFromGMT: 0)

        formatter.timeZone
        let date = formatter.date(from: input)
        return date
    }
}

let date = Date.dateFromString("2021-02-26T18:46:55.029236+09:00")





// MARK: Adding 1 week to "today"
let oneWeekLater = Calendar.current.date(byAdding: .weekOfYear, value: 1, to: Date())
