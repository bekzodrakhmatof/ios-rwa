import SwiftUI

struct TransactionDetail: View {
    
    var transaction: Transaction
    
    var body: some View {
		VStack(alignment: .center) {
            Image(transaction.bird ? "Birdflow" : "Outflow")
            Text(transaction.title)
            Text(transaction.amount.currencyFormat())
                .bold()
				.font(.title)
            Text("Congratulations on earning your bird!")
                .font(.footnote)
                .foregroundColor(Color(.systemGray))
                .opacity(transaction.bird ? 1 : 0)
		}
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.vertical, 30)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

struct TransactionDetail_Previews: PreviewProvider {
	static let typeSizes: [DynamicTypeSize] = [
		.xSmall,
		.large,
		.xxxLarge
	]

	static var previews: some View {
		Group {
			ForEach(typeSizes, id: \.self) { size in
                TransactionDetail(transaction: Transaction(id: "", title: "Test", date: "2023-11-11", amount: 1, bird: true, status: "Completed"))
					.environment(\.dynamicTypeSize, size)
					.previewDisplayName("\(size)")
			}
            TransactionDetail(transaction: Transaction(id: "", title: "Test", date: "2023-11-11", amount: 1, bird: true, status: "Completed"))
				.background(Color(.systemBackground))
				.environment(\.colorScheme, .dark)
				.previewDisplayName("dark")
		}
        .previewLayout(.sizeThatFits)
	}
}
