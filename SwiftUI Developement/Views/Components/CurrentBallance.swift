import SwiftUI

struct CurrentBallance: View {
    var body: some View {
		VStack(alignment: .leading) {
			Text("Current Ballance")
				.bold()
			VStack(alignment: .leading) {
				Text("Ballance as of July 26, 2021")
					.font(.footnote)
				Text("$139.47")
					.bold()
					.font(.title)
			}.padding()
				.background(Color(.systemGray5))
		}
    }
}

struct CurrentBallance_Previews: PreviewProvider {
    static var previews: some View {
        CurrentBallance()
			.previewLayout(.sizeThatFits)
    }
}
