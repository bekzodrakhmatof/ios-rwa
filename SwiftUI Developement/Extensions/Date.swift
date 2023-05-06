import Foundation

extension Date {
    
	func format() -> String {
		return self.formatted(date: .abbreviated, time: .omitted)
	}
    
    func usFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        let expireString = dateFormatter.string(from: self)
        return expireString
    }
}
