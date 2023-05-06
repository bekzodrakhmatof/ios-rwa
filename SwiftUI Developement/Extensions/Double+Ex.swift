//
//  Double+Ex.swift
//  SwiftUI Developement
//
//  Created by Rakhmatov Bekzod on 06/05/23.
//

import SwiftUI

extension Double {
    func currencyFormat() -> String {
        if self < 0 {
            return String(format: "-$%.2f", abs(self))
        } else {
            return String(format: "$%.2f", self)
        }
    }
}
