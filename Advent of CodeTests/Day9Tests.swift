//
//  Day9Tests.swift
//  Advent of CodeTests
//
//  Created by Ryan Arana on 12/11/18.
//  Copyright © 2018 aranasaurus.com. All rights reserved.
//

import XCTest
@testable import Advent_of_Code

private typealias Day9 = AdventOfCode2018.Day9

class Day9Tests: XCTestCase {
    func testPart1_samples() {
        XCTAssertEqual(Day9.part1(inputs: "9 players; last marble is worth 25 points"), 32)
        XCTAssertEqual(Day9.part1(inputs: "10 players; last marble is worth 1618 points"), 8317)
        XCTAssertEqual(Day9.part1(inputs: "13 players; last marble is worth 7999 points"), 146373)
        XCTAssertEqual(Day9.part1(inputs: "17 players; last marble is worth 1104 points"), 2764)
        XCTAssertEqual(Day9.part1(inputs: "21 players; last marble is worth 6111 points"), 54718)
        XCTAssertEqual(Day9.part1(inputs: "30 players; last marble is worth 5807 points"), 37305)
    }

    func testPart1() {
        XCTAssertEqual(Day9.part1(), 384288)
    }

    func testPerformancePart1() {
        measure {
            XCTAssertEqual(Day9.part1(), 384288)
        }
    }

    func testPart2() {
        XCTAssertEqual(Day9.part2(), 384288)
    }
}
