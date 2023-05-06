//
//  TransactionCell.swift
//  SwiftUI Developement
//
//  Created by Rakhmatov Bekzod on 06/05/23.
//

import SwiftUI

struct TransactionCell: View {
    
    var transaction: Transaction
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack {
                Text(transaction.title)
                if transaction.bird {
                    Image("Bird")
                }
                Spacer(minLength: 32)
                Text(transaction.amount.currencyFormat())
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
            }
            .font(.callout.bold())
            .foregroundColor(.primary)
            Text(transaction.date.usFormat())
                .font(.footnote)
                .foregroundColor(.secondary)
            Divider().padding(.top, 10)
        }
    }
}

struct TransactionCell_Previews: PreviewProvider {

    static let typeSizes: [DynamicTypeSize] = [
        .xSmall,
        .large,
        .xxxLarge
    ]

    static var previews: some View {
        Group {
            ForEach(typeSizes, id: \.self) { size in
                TransactionCell(transaction: Transaction(id: "", title: "Test", date: "2023-11-11", amount: 1, bird: true, status: "Completed"))
                    .environment(\.dynamicTypeSize, size)
                    .previewDisplayName("\(size)")
            }
            TransactionCell(transaction: Transaction(id: "", title: "Test", date: "2023-11-11", amount: 1, bird: true, status: "Completed"))
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("dark")
        }
        .previewLayout(.sizeThatFits)
    }
}
