//
//  Day3Tests.swift
//  Advent of CodeTests
//
//  Created by Ryan Arana on 12/2/18.
//  Copyright © 2018 aranasaurus.com. All rights reserved.
//

import XCTest
@testable import Advent_of_Code

private typealias Day3 = AdventOfCode2018.Day3

class Day3Tests: XCTestCase {
    func testPart1() {
        XCTAssertEqual(Day3.part1(), 105231)
    }

    func testPerformancePart1() {
        self.measure {
            XCTAssertEqual(Day3.part1(), 105231)
        }
    }

    func testPart1_samples() {
        let inputs = """
#1 @ 1,3: 4x4
#2 @ 3,1: 4x4
#3 @ 3,3: 2x2
"""
        XCTAssertEqual(Day3.part1(inputs: inputs), 4)
    }

    func testClaimOverlapCalc() {
        let c1 = Day3.Claim(id: 1, x: 1, y: 3, w: 4, h: 4)
        var c2 = Day3.Claim(id: 2, x: 3, y: 1, w: 4, h: 4)
        XCTAssertEqual(c1.amountOfOverlap(with: c2), 4)
        XCTAssertEqual(c2.amountOfOverlap(with: c1), 4)

        c2 = Day3.Claim(id: 2, x: 2, y: 1, w: 4, h: 4)
        XCTAssertEqual(c1.amountOfOverlap(with: c2), 6)
        XCTAssertEqual(c2.amountOfOverlap(with: c1), 6)

        c2 = Day3.Claim(id: 2, x: 3, y: 1, w: 5, h: 4)
        XCTAssertEqual(c1.amountOfOverlap(with: c2), 4)
        XCTAssertEqual(c2.amountOfOverlap(with: c1), 4)

        c2 = Day3.Claim(id: 2, x: 3, y: 1, w: 4, h: 5)
        XCTAssertEqual(c1.amountOfOverlap(with: c2), 6)
        XCTAssertEqual(c2.amountOfOverlap(with: c1), 6)

        c2 = Day3.Claim(id: 2, x: 3, y: 1, w: 4, h: 6)
        XCTAssertEqual(c1.amountOfOverlap(with: c2), 8)
        XCTAssertEqual(c2.amountOfOverlap(with: c1), 8)

        c2 = Day3.Claim(id: 2, x: 3, y: 1, w: 8, h: 8)
        XCTAssertEqual(c1.amountOfOverlap(with: c2), 8)
        XCTAssertEqual(c2.amountOfOverlap(with: c1), 8)

        c2 = Day3.Claim(id: 2, x: 0, y: 0, w: 8, h: 8)
        XCTAssertEqual(c1.amountOfOverlap(with: c2), 16)
        XCTAssertEqual(c2.amountOfOverlap(with: c1), 16)

        c2 = Day3.Claim(id: 2, x: 10, y: 10, w: 8, h: 8)
        XCTAssertEqual(c1.amountOfOverlap(with: c2), 0)
        XCTAssertEqual(c2.amountOfOverlap(with: c1), 0)
    }

    func testPart2() {
        XCTAssertEqual(Day3.part2(), 164)
    }

    func testPerformancePart2() {
        measure {
            XCTAssertEqual(Day3.part2(), 164)
        }
    }

    func testPart2_samples() {
        let inputs = """
#1 @ 1,3: 4x4
#2 @ 3,1: 4x4
#3 @ 5,5: 2x2
"""
        XCTAssertEqual(Day3.part2(inputs: inputs), 3)
    }
}
