//
//  String+Ex.swift
//  SwiftUI Developement
//
//  Created by Rakhmatov Bekzod on 06/05/23.
//

import SwiftUI

extension String {

    func cardExpireDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM"
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "yy/MM"
            let expireString = dateFormatter.string(from: date)
            return expireString
        }
        return "--/--"
    }
    
    func usFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "MMM dd, yyyy"
            let dateString = dateFormatter.string(from: date)
            return dateString
        }
        return ""
    }
}
