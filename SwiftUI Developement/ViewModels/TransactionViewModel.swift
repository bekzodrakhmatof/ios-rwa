//
//  TransactionViewModel.swift
//  SwiftUI Developement
//
//  Created by Rakhmatov Bekzod on 06/05/23.
//

import SwiftUI

final class TransactionViewModel: ObservableObject {

    @Published private(set) var transaction: Transaction?

    func fetch(id: String) {
        APIService().getTransactionDetail(id: id) { [weak self] transaction in
            self?.transaction = transaction
        }
    }
}
