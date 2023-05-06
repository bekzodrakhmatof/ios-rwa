//
//  RewardsInfo.swift
//  SwiftUI Developement
//
//  Created by Rakhmatov Bekzod on 06/05/23.
//

import SwiftUI

struct RewardsInfo: Codable {
    let cardNumber: String
    let cardExpirationDate: String
    let balance: Double
    let transactions: [Transaction]
    init(cardNumber: String? = nil, cardExpirationDate: String? = nil, balance: Double? = nil, transactions: [Transaction]? = nil) {
        self.cardNumber = cardNumber ?? ""
        self.cardExpirationDate = cardExpirationDate ?? ""
        self.balance = balance ?? 0
        self.transactions = transactions ?? []
    }
}

struct Transaction: Codable, Identifiable {
    let id, title, date: String
    let amount: Double
    let bird: Bool
    let status: String?
}
