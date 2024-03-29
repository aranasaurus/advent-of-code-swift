//
//  Entry2021Day07Tests.swift
//  AdventOfCodeTests
//
//  Created by Ryan Arana on 12/7/21.
//

import XCTest

@testable import AdventOfCode

class Entry2021Day07Tests: XCTestCase {
    func testSampleData() async {
        let sample = "16,1,2,0,4,2,7,1,2,14"
        let entry = Entry2021Day07(.part1)
        let result = await entry.run(for: sample)
        XCTAssertEqual(result, 37)

        entry.part = .part2
        let part2Result = await entry.run(for: sample)
        XCTAssertEqual(part2Result, 168)
    }

    func testInput() async throws {
        try await validateInput(Entry2021Day07(.part1), expected: "326132")
        try await validateInput(Entry2021Day07(.part2), expected: "88612508")
    }
}
