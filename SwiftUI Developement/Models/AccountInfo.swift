import Foundation

struct AccountInfo: Codable {
	var firstName: String 			= ""
	var lastName: String  			= ""
	var email: String     			= ""
	var details: AccountInfoDetails = AccountInfoDetails()

	var fullName: String {
		get { return "\(firstName) \(lastName)"}
	}
}

struct AccountInfoDetails: Codable {
	var studentID: String			= ""
	var campusID: String			= ""
	var gtLevel: String				= ""
	var mapGradeLevel: Int			= 0
	var house: String				= ""

	var level: String {
		get { return "L\(gtLevel)" }
	}
}
