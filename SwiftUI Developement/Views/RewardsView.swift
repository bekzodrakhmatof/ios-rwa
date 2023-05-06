//
//  Rewards.swift
//  SwiftUI Developement
//
//  Created by Rakhmatov Bekzod on 06/05/23.
//

import SwiftUI

struct RewardsView: View {
    
    @ObservedObject var viewModel = RewardsViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 16) {
                    CardView(lastDigit: viewModel.rewarsInfo.cardNumber, expireData: viewModel.rewarsInfo.cardExpirationDate)
                    BalanceView()
                    if viewModel.rewarsInfo.transactions.count > 0 {
                        TransactionList()
                    }
                }
                .padding()
            }
            .navigationTitle("Rewards")
        }
    }
    
    @ViewBuilder func BalanceView() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionTitleView(title: "Current Balance")
            VStack(alignment: .leading, spacing: 4) {
                Text("Balance as of \(Date().usFormat())")
                    .foregroundColor(.secondary)
                Text(viewModel.rewarsInfo.balance.currencyFormat())
                    .font(.largeTitle.bold())
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.systemGray6))
            .cornerRadius(12)
        }
    }
    
    @ViewBuilder func TransactionList() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionTitleView(title: "Latest Transactions")
            VStack(alignment: .leading, spacing: 12) {
                ForEach(viewModel.rewarsInfo.transactions) { transaction in
                    NavigationLink {
                        TransactionView(transaction: transaction)
                    } label: {
                        TransactionCell(transaction: transaction)
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.systemGray6))
            .cornerRadius(12)
        }
    }
}

struct Rewards_Previews: PreviewProvider {
 
    static let typeSizes: [DynamicTypeSize] = [
        .xSmall,
        .large,
        .xxxLarge
    ]

    static var previews: some View {
        Group {
            ForEach(typeSizes, id: \.self) { size in
                RewardsView()
                    .environment(\.dynamicTypeSize, size)
                    .previewDisplayName("\(size)")
            }
            RewardsView()
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("dark")
        }
        .previewLayout(.sizeThatFits)
    }
}
