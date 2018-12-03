//
//  Day2Tests.swift
//  Advent of CodeTests
//
//  Created by Ryan Arana on 12/2/18.
//  Copyright © 2018 aranasaurus.com. All rights reserved.
//

import XCTest
@testable import Advent_of_Code

class Day2Tests: XCTestCase {
    func testPart1() {
        XCTAssertEqual(AdventOfCode2018.Day2.part1(), 6225)
    }

    func testPart1_samples() {
        /*
         abcdef contains no letters that appear exactly two or three times.
         bababc contains two a and three b, so it counts for both.
         abbcde contains two b, but no letter appears exactly three times.
         abcccd contains three c, but no letter appears exactly two times.
         aabcdd contains two a and two d, but it only counts once.
         abcdee contains two e.
         ababab contains three a and three b, but it only counts once.
         */
        typealias Day2 = AdventOfCode2018.Day2
        typealias ScanResult = Day2.ScanResult
        XCTAssertEqual(Day2.scan("abcdef"), ScanResult())
        XCTAssertEqual(Day2.scan("bababc"), ScanResult(hasDoubles: true, hasTriples: true))
        XCTAssertEqual(Day2.scan("abbcde"), ScanResult(hasDoubles: true, hasTriples: false))
        XCTAssertEqual(Day2.scan("abcccd"), ScanResult(hasDoubles: false, hasTriples: true))
        XCTAssertEqual(Day2.scan("aabcdd"), ScanResult(hasDoubles: true, hasTriples: false))
        XCTAssertEqual(Day2.scan("abcdee"), ScanResult(hasDoubles: true, hasTriples: false))
        XCTAssertEqual(Day2.scan("ababab"), ScanResult(hasDoubles: false, hasTriples: true))

        let checksum = Day2.part1(inputs: """
            abcdef
            bababc
            abbcde
            abcccd
            aabcdd
            abcdee
            ababab
            """
        )
        XCTAssertEqual(checksum, 12)
    }

    func testPerformancePart1() {
        self.measure {
            XCTAssertEqual(AdventOfCode2018.Day2.part1(), 6225)
        }
    }

    func testPart2() {
        XCTAssertEqual(AdventOfCode2018.Day2.part2(), "revtaubfniyhsgxdoajwkqilp")
    }

    func testPart2_samples() {
        let inputs = ["abcde", "fghij", "klmno", "pqrst", "fguij", "axcye", "wvxyz"]
        XCTAssertEqual(AdventOfCode2018.Day2.part2(inputs: inputs.joined(separator: "\n")), "fgij")
    }

    func testPerformancePart2() {
        self.measure {
            XCTAssertEqual(AdventOfCode2018.Day2.part2(), "revtaubfniyhsgxdoajwkqilp")
        }
    }
}
