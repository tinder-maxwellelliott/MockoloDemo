//
//  NetworkProtocol.swift
//  MockoloDemo
//
//  Created by Maxwell Elliott on 3/20/20.
//  Copyright © 2020 Tinder. All rights reserved.
//

import Foundation

/// @mockable
protocol Networking {
    func fetchData(completion: ((Data?) -> Void))
}
