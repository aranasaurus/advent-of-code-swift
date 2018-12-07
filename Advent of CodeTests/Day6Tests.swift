//
//  Day6Tests.swift
//  Advent of CodeTests
//
//  Created by Ryan Arana on 12/5/18.
//  Copyright © 2018 aranasaurus.com. All rights reserved.
//

import XCTest
@testable import Advent_of_Code

private typealias Day6 = AdventOfCode2018.Day6

class Day6Tests: XCTestCase {
    func testPart1() {
        XCTAssertEqual(Day6.part1(), 3290)
    }

    func testPerformancePart1() {
        self.measure {
            XCTAssertEqual(Day6.part1(), 3290)
        }
    }

    func testPart1_samples() {
        let sample = """
1, 1
1, 6
8, 3
3, 4
5, 5
8, 9
"""
        XCTAssertEqual(Day6.part1(inputs: sample), 17)
    }
}
