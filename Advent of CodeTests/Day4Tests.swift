//
//  Day4Tests.swift
//  Advent of CodeTests
//
//  Created by Ryan Arana on 12/3/18.
//  Copyright © 2018 aranasaurus.com. All rights reserved.
//

import XCTest

@testable import Advent_of_Code

private typealias Day4 = AdventOfCode2018.Day4

class Day4Tests: XCTestCase {
    func testPart1() {
        XCTAssertEqual(Day4.part1(), 12504)
    }

    func testPerformancePart1() {
        measure {
            XCTAssertEqual(Day4.part1(), 12504)
        }
    }

    func testPart1_samples() {
        let inputs = """
[1518-11-01 00:00] Guard #10 begins shift
[1518-11-01 00:05] falls asleep
[1518-11-01 00:25] wakes up
[1518-11-01 00:30] falls asleep
[1518-11-01 00:55] wakes up
[1518-11-01 23:58] Guard #99 begins shift
[1518-11-02 00:40] falls asleep
[1518-11-02 00:50] wakes up
[1518-11-03 00:05] Guard #10 begins shift
[1518-11-03 00:24] falls asleep
[1518-11-03 00:29] wakes up
[1518-11-04 00:02] Guard #99 begins shift
[1518-11-04 00:36] falls asleep
[1518-11-04 00:46] wakes up
[1518-11-05 00:03] Guard #99 begins shift
[1518-11-05 00:45] falls asleep
[1518-11-05 00:55] wakes up
"""
        XCTAssertEqual(Day4.part1(input: inputs), 240)
    }

    func testEvent_init() {
        XCTAssertEqual(Day4.Event(line: "[1518-11-01 00:00] Guard #10 begins shift"), Day4.Event.beginShift(id: 10))
        XCTAssertEqual(Day4.Event(line: "[1518-11-01 00:05] falls asleep"), Day4.Event.fallAsleep)
        XCTAssertEqual(Day4.Event(line: "[1518-11-01 00:25] wakes up"), Day4.Event.wakeUp)
    }

    func testParseDate() {
        let verifyDate: (_ date: Date, _ year: Int, _ month: Int, _ day: Int, _ hour: Int, _ minute: Int) -> Void = { (date, year, month, day, hour, minute) in
            let components = Calendar.current.dateComponents(in: TimeZone(secondsFromGMT: 0)!, from: date)
            XCTAssertEqual(components.year, year)
            XCTAssertEqual(components.month, month)
            XCTAssertEqual(components.day, day)
            XCTAssertEqual(components.hour, hour)
            XCTAssertEqual(components.minute, minute)
        }
        verifyDate(
            Day4.parseDate(from: "[1518-11-01 00:00] Guard #10 begins shift")!,
            1518, 11, 1, 0, 0
        )
        verifyDate(
            Day4.parseDate(from: "[1518-11-01 00:05] falls asleep")!,
            1518, 11, 1, 0, 5
        )
        verifyDate(
            Day4.parseDate(from: "[1518-11-01 00:25] wakes up")!,
            1518, 11, 1, 0, 25
        )
        verifyDate(
            Day4.parseDate(from: "[1518-11-01 23:58] Guard #99 begins shift")!,
            1518, 11, 1, 23, 58
        )
        verifyDate(
            Day4.parseDate(from: "[1518-11-05 00:55] wakes up")!,
            1518, 11, 5, 0, 55
        )
    }
}
