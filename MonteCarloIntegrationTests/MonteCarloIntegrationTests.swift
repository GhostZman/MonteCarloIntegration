//
//  MonteCarloIntegrationTests.swift
//  MonteCarloIntegrationTests
//
//  Created by Phys440Zachary on 2/9/24.
//

import XCTest

final class MonteCarloIntegrationTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() async throws {
        let integrator = MonteCarloIntegrator()
        
        let lowerX = 0.0
        let upperX = 1.0
        
        let integral = await integrator.calculateIntegral(lowerXLimit: lowerX, upperXLimit: upperX, numGuesses: 10000000)
        
        let exactValue = 1 - exp(-1.0)
        
        print(exactValue)
        print(integral)
        
        XCTAssertEqual(integral, exactValue, accuracy: 1.0E-2, "Was not equal to this resolution.")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
