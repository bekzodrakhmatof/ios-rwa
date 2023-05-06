//
//  CardView.swift
//  SwiftUI Developement
//
//  Created by Rakhmatov Bekzod on 06/05/23.
//

import SwiftUI

struct CardView: View {
    
    var lastDigit: String
    var expireData: String
    
    var body: some View {
        ZStack {
            Image("Card")
                .resizable()
            VStack(alignment: .leading) {
                Image("Alpha Logo")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("**** \(lastDigit)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title.bold())
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Expiration Date")
                            .font(.footnote)
                        HStack {
                            Text(expireData.cardExpireDate())
                                .font(.headline.bold())
                            Spacer()
                            Image("Visa")
                        }
                    }
                }
                .foregroundColor(.white)
            }
            .padding()
        }
        .aspectRatio(contentMode: .fit)
    }
}

struct CardView_Previews: PreviewProvider {
    
    static let typeSizes: [DynamicTypeSize] = [
        .xSmall,
        .large,
        .xxxLarge
    ]

    static var previews: some View {
        Group {
            ForEach(typeSizes, id: \.self) { size in
                CardView(lastDigit: "9901", expireData: "2023-12")
                    .environment(\.dynamicTypeSize, size)
                    .previewDisplayName("\(size)")
            }
            CardView(lastDigit: "9901", expireData: "2023-12")
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("dark")
        }
        .previewLayout(.sizeThatFits)
    }
}
