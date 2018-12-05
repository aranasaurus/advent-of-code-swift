//
//  Day5Tests.swift
//  Advent of CodeTests
//
//  Created by Ryan Arana on 12/4/18.
//  Copyright © 2018 aranasaurus.com. All rights reserved.
//

import XCTest

@testable import Advent_of_Code

private typealias Day5 = AdventOfCode2018.Day5

class Day5Tests: XCTestCase {
    func testPart1() {
        XCTAssertEqual(Day5.part1(), 10762)
    }

    func testPerformancePart1() {
        self.measure {
            XCTAssertEqual(Day5.part1(), 10762)
        }
    }

    func testPart1_samples() {
        let inputs = "dabAcCaCBAcCcaDA"
        XCTAssertEqual(Day5.part1(inputs: inputs), 10)
    }

    func testPart2() {
        XCTAssertEqual(Day5.part2(), 6946)
    }

    func testPerformancePart2() {
        self.measure {
            XCTAssertEqual(Day5.part2(), 6946)
        }
    }

    func testPart2_samples() {
        let inputs = "dabAcCaCBAcCcaDA"
        XCTAssertEqual(Day5.part2(inputs: inputs), 4)
    }

    func testReactions() {
        XCTAssertEqual(Day5.resolveReactions(for: "aA"), "")
        XCTAssertEqual(Day5.resolveReactions(for: "abBA"), "")
        XCTAssertEqual(Day5.resolveReactions(for: "abAB"), "abAB")
        XCTAssertEqual(Day5.resolveReactions(for: "aabAAB"), "aabAAB")
    }
}
