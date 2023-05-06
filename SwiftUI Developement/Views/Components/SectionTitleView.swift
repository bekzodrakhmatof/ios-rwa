//
//  SectionTitleView.swift
//  SwiftUI Developement
//
//  Created by Rakhmatov Bekzod on 06/05/23.
//

import SwiftUI

struct SectionTitleView: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.title2.bold())
    }
}

struct SectionTitleView_Previews: PreviewProvider {
 
    static let typeSizes: [DynamicTypeSize] = [
        .xSmall,
        .large,
        .xxxLarge
    ]

    static var previews: some View {
        Group {
            ForEach(typeSizes, id: \.self) { size in
                SectionTitleView(title: "Test")
                    .environment(\.dynamicTypeSize, size)
                    .previewDisplayName("\(size)")
            }
            SectionTitleView(title: "Test")
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("dark")
        }
        .previewLayout(.sizeThatFits)
    }
}
