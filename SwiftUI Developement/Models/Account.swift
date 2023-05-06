import Foundation

struct AccountInfo: Codable, Identifiable {
	let id = UUID()
	var firstName: String
	var lastName: String
	var email: String
}
