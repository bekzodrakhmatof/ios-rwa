//
//  TransactionView.swift
//  SwiftUI Developement
//
//  Created by Rakhmatov Bekzod on 06/05/23.
//

import SwiftUI

struct TransactionView: View {
    
    @ObservedObject var viewModel = TransactionViewModel()
    var transaction: Transaction
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                TransactionDetail(transaction: transaction)
                DetailView()
                Spacer()
            }
            .padding()
        }
        .onAppear {
            viewModel.fetch(id: transaction.id)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder func DetailView() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionTitleView(title: "Transaction Details")
            VStack(alignment: .leading, spacing: 12) {
                KeyValueListItem(key: "Status", value: viewModel.transaction?.status)
                Divider()
                KeyValueListItem(key: "Date", value: transaction.date.usFormat())
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.systemGray6))
            .cornerRadius(12)
        }
    }
}

struct TransactionView_Previews: PreviewProvider {
    
    static let typeSizes: [DynamicTypeSize] = [
        .xSmall,
        .large,
        .xxxLarge
    ]

    static var previews: some View {
        Group {
            ForEach(typeSizes, id: \.self) { size in
                TransactionView(transaction: Transaction(id: "", title: "Test", date: "2023-11-11", amount: 1, bird: true, status: "Completed"))
                    .environment(\.dynamicTypeSize, size)
                    .previewDisplayName("\(size)")
            }
            TransactionView(transaction: Transaction(id: "", title: "Test", date: "2023-11-11", amount: 1, bird: true, status: "Completed"))
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("dark")
        }
        .previewLayout(.sizeThatFits)
    }
}
