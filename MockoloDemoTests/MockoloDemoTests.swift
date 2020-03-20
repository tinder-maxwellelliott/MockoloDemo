//
//  MockoloDemoTests.swift
//  MockoloDemoTests
//
//  Created by Maxwell Elliott on 3/20/20.
//  Copyright © 2020 Tinder. All rights reserved.
//

import XCTest
@testable import MockoloDemo

class MockoloDemoTests: XCTestCase {
    var networking: NetworkingMock!
    var successFlow: SucccessFlowingMock!
    var errorFlow: ErrorFlowingMock!

    override func setUp() {
        super.setUp()
        networking = NetworkingMock()
        successFlow = SucccessFlowingMock()
        errorFlow = ErrorFlowingMock()
    }

    func testErrorFlow() {
        let flow = MyFlow(networking: networking,
                          successFlow: successFlow,
                          errorFlow: errorFlow)
        networking.fetchDataHandler = { completion in
            completion(nil)
        }
        XCTAssertEqual(successFlow.startCallCount, 0)
        XCTAssertEqual(errorFlow.startCallCount, 0)
        flow.start()
        XCTAssertEqual(successFlow.startCallCount, 0)
        XCTAssertEqual(errorFlow.startCallCount, 1)
    }

    func testSuccessFlow() {
        let flow = MyFlow(networking: networking,
                          successFlow: successFlow,
                          errorFlow: errorFlow)
        networking.fetchDataHandler = { completion in
            completion(Data())
        }
        XCTAssertEqual(successFlow.startCallCount, 0)
        XCTAssertEqual(errorFlow.startCallCount, 0)
        flow.start()
        XCTAssertEqual(successFlow.startCallCount, 1)
        XCTAssertEqual(errorFlow.startCallCount, 0)
    }
}
