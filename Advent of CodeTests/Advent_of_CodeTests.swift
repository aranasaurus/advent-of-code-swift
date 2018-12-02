//
//  Advent_of_CodeTests.swift
//  Advent of CodeTests
//
//  Created by Ryan Arana on 12/1/18.
//  Copyright © 2018 aranasaurus.com. All rights reserved.
//

import XCTest
@testable import Advent_of_Code

class Advent_of_CodeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDay1Part1() {
        XCTAssertEqual(AdventOfCode2018.Day1.part1(), 536)
    }

    func testDay1Part2() {
        XCTAssertEqual(AdventOfCode2018.Day1.part2(), 75108)
    }

    func testDay1Part2_samples() {
        // +1, -1 first reaches 0 twice.
        XCTAssertEqual(AdventOfCode2018.Day1.part2(inputs: "+1\n-1"), 0)
        XCTAssertEqual(AdventOfCode2018.Day1.part2(inputs: "+3\n+3\n+4\n-2\n-4"), 10)
        XCTAssertEqual(AdventOfCode2018.Day1.part2(inputs: "-6\n+3\n+8\n+5\n-6"), 5)
        XCTAssertEqual(AdventOfCode2018.Day1.part2(inputs: "+7\n+7\n-2\n-7\n-4"), 14)
    }

    func testPerformanceDay1Part1() {
        // This is an example of a performance test case.
        self.measure {
            _ = AdventOfCode2018.Day1.part1()
        }
    }

    func testPerformanceDay1Part2() {
        // This is an example of a performance test case.
        self.measure {
            _ = AdventOfCode2018.Day1.part2()
        }
    }
}
