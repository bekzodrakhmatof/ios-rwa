import SwiftUI

struct MainContainer: View {
	var body: some View {
		TabView {
            RewardsView()
                .tabItem {
                    Label("Rewards", systemImage: "giftcard.fill")
                }
			AccountView()
				.tabItem {
					Label("Account", systemImage: "person")
				}
		}
    }
}

struct MainContainer_Previews: PreviewProvider {
	static let typeSizes: [DynamicTypeSize] = [
		.xSmall,
		.large,
		.xxxLarge
	]

	static var previews: some View {
		Group {
			ForEach(typeSizes, id: \.self) { size in
				MainContainer()
					.environment(\.dynamicTypeSize, size)
					.previewDisplayName("\(size)")
			}
			MainContainer()
				.background(Color(.systemBackground))
				.environment(\.colorScheme, .dark)
				.previewDisplayName("dark")
		}.previewLayout(.sizeThatFits)
    }
}
