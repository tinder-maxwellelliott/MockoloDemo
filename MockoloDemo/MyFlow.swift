//
//  MyFlow.swift
//  MockoloDemo
//
//  Created by Maxwell Elliott on 3/20/20.
//  Copyright © 2020 Tinder. All rights reserved.
//

import Foundation

class MyFlow: Flowing {
    private let networking: Networking
    private let successFlow: SucccessFlowing
    private let errorFlow: ErrorFlowing
    
    init(networking: Networking,
         successFlow: SucccessFlowing,
         errorFlow: ErrorFlowing) {
        self.networking = networking
        self.successFlow = successFlow
        self.errorFlow = errorFlow
    }

    func start() {
        networking.fetchData { [weak self] (data) in
            guard let _ = data else {
                self?.errorFlow.start()
                return
            }
            self?.successFlow.start()
        }
    }
}
