import SwiftUI

struct CurrentBalance: View {
	var date: Date
	var balance: Float

	var body: some View {
		VStack(alignment: .leading) {
			Text("Balance as of \(date.format())")
				.foregroundColor(Color(.systemGray))
			Text("$139.47")
				.bold()
				.font(.title)
		}.padding()
			.background(Color(.systemGray6))
			.cornerRadius(12)
    }
}

struct CurrentBalance_Previews: PreviewProvider {
	static let typeSizes: [DynamicTypeSize] = [
		.xSmall,
		.large,
		.xxxLarge
	]

	static var previews: some View {
		Group {
			ForEach(typeSizes, id: \.self) { size in
				CurrentBalance(
					date: Date.now,
					balance: 139.47
				)
					.environment(\.dynamicTypeSize, size)
					.previewDisplayName("\(size)")
			}
			CurrentBalance(
				date: Date.now,
				balance: 139.47
			)
				.background(Color(.systemBackground))
				.environment(\.colorScheme, .dark)
				.previewDisplayName("dark")
		}.previewLayout(.sizeThatFits)
	}
}
