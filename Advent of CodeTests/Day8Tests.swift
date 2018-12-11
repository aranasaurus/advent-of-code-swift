//
//  Day8Tests.swift
//  Advent of CodeTests
//
//  Created by Ryan Arana on 12/9/18.
//  Copyright © 2018 aranasaurus.com. All rights reserved.
//

import XCTest
@testable import Advent_of_Code

private typealias Day8 = AdventOfCode2018.Day8

class Day8Tests: XCTestCase {
    let sample = "2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2"

    func testPart1_samples() {
        XCTAssertEqual(Day8.part1(inputs: sample), 138)
    }

    func testPart1() {
        XCTAssertEqual(Day8.part1(), 41760)
    }

    func testPerformancePart1() {
        measure {
            XCTAssertEqual(Day8.part1(), 41760)
        }
    }
}
