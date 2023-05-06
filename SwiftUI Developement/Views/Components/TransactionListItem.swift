import SwiftUI

struct TransactionListItem: View {
	var title: String;
	var transactionDate: Date;
	var amount: Float;
	var birdEarned: Bool?;

    var body: some View {
		HStack(alignment: .top, spacing: 16) {
			VStack(alignment: .leading) {
				Text(title)
					.font(.headline)
					.bold()
					.truncationMode(.middle)
					.lineLimit(1)
				Text(transactionDate, format: .dateTime.day().month().year())
					.font(.subheadline)
			}
			Spacer()
			Text(String(format: "$%.2f", amount))
				.font(.headline)
				.bold()
		}.frame(maxWidth: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
	static let dynamicSizes: [DynamicTypeSize] = [
		.xSmall,
		.large,
		.xxxLarge
	];
	static var previews: some View {
		Group() {
			ForEach(dynamicSizes, id: \.self) { size in
				TransactionListItem(
					title: "Starbucks Testing Long Item",
					transactionDate: Date.now,
					amount: 10.54
				).environment(\.dynamicTypeSize, size)
					.previewDisplayName("\(size)")
			}
			TransactionListItem(
				title: "Starbucks",
				transactionDate: Date.now,
				amount: 10.54
			).background(Color(.systemBackground))
				.environment(\.colorScheme, .dark)
				.previewDisplayName("dark")
		}.previewLayout(.sizeThatFits)
    }
}
