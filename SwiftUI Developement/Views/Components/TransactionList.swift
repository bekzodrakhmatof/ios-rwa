import SwiftUI

struct TransactionList: View {
	var body: some View {
		VStack(alignment: .leading) {
			Text("Latest Transactions")
			List() {
				ForEach(1...10, id: \.self) {
					TransactionListItem(
						title: "Iten \($0)",
						transactionDate: Date.now,
						amount: 10.54,
						birdEarned: false
					)
				}
			}.listStyle(.automatic)
		}
    }
}

struct TransactionList_Previews: PreviewProvider {
	static let dynamicSizes: [DynamicTypeSize] = [
		.xSmall,
		.large,
		.xxxLarge
	];
	static var previews: some View {
		Group() {
			ForEach(dynamicSizes, id: \.self) { size in
				TransactionList()
					.environment(\.dynamicTypeSize, size)
					.previewDisplayName("\(size)")
			}
			TransactionList().background(Color(.systemBackground))
				.environment(\.colorScheme, .dark)
				.previewDisplayName("dark")
.previewInterfaceOrientation(.portraitUpsideDown)
		}.previewLayout(.sizeThatFits)
	}
}
