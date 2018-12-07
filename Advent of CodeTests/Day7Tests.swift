//
//  Day7Tests.swift
//  Advent of CodeTests
//
//  Created by Ryan Arana on 12/6/18.
//  Copyright © 2018 aranasaurus.com. All rights reserved.
//

import XCTest
@testable import Advent_of_Code

private typealias Day7 = AdventOfCode2018.Day7

class Day7Tests: XCTestCase {
    let sample = """
Step C must be finished before step A can begin.
Step C must be finished before step F can begin.
Step A must be finished before step B can begin.
Step A must be finished before step D can begin.
Step B must be finished before step E can begin.
Step D must be finished before step E can begin.
Step F must be finished before step E can begin.
"""

    func testPart1_samples() {
        XCTAssertEqual(Day7.part1(inputs: sample), "CABDFE")
    }

    func testPart1() {
        XCTAssertEqual(Day7.part1(), "AEMNPOJWISZCDFUKBXQTHVLGRY")
    }

    func testPerformancePart1() {
        measure {
            XCTAssertEqual(Day7.part1(), "AEMNPOJWISZCDFUKBXQTHVLGRY")

        }
    }
}
