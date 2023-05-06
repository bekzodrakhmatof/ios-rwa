//
//  RewardsViewModel.swift
//  SwiftUI Developement
//
//  Created by Rakhmatov Bekzod on 06/05/23.
//

import Combine

final class RewardsViewModel: ObservableObject {
    init() { fetch() }

    @Published private(set) var rewarsInfo = RewardsInfo()

    private func fetch() {
        APIService().getRewards { [weak self] rewarsInfo in
            self?.rewarsInfo = rewarsInfo
        }
    }
}
