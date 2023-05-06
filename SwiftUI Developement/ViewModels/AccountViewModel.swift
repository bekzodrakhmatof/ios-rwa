import Combine

final class AccountViewModel: ObservableObject {
	init() { fetch() }

	@Published private(set) var account = AccountInfo()

	private func fetch() {
		APIService().getAccount { self.account = $0 }
	}
}
