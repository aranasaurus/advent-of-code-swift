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
    let sample = """
1, 1
1, 6
8, 3
3, 4
5, 5
8, 9
"""

    func testPart1() {
        XCTAssertEqual(Day6.part1(), 3290)
    }

    func testPerformancePart1() {
        self.measure {
            XCTAssertEqual(Day6.part1(), 3290)
        }
    }

    func testPart1_samples() {
        XCTAssertEqual(Day6.part1(inputs: sample), 17)
    }

    func testPart2_samples() {
        XCTAssertEqual(Day6.part2(inputs: sample, range: 32), 0)
    }

    func testDistanceToAll() {
        let grid = Day6.Grid(inputs: sample)
        let location = Day6.Location(4, 3)
        XCTAssertEqual(location.dist(from: grid.locations), 30)
    }

    func testPerformanceDistanceToAll() {
        let grid = Day6.Grid(inputs: Day6.rawInput)
        let location = Day6.Location(150, 150)
        measure {
            XCTAssertEqual(location.dist(from: grid.locations), 8938)
        }
    }
}
