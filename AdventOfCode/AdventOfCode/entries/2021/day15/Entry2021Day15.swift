//
//  Entry2021Day15.swift
//  AdventOfCode
//
//  Created by Ryan Arana on 12/16/21.
//

import Foundation

class Entry2021Day15: Entry {
    init(_ part: Part) {
        super.init(year: 2021, day: 15, part: part)
    }

    @Sendable override func run() async throws {
        let inputs = try String(contentsOf: try fileURL())
            .split(separator: "\n")

        let answer = await run(for: inputs)
        DispatchQueue.main.async {
            self.answer = "\(answer)"
        }
    }

    func run<AnyString: StringProtocol>(for input: [AnyString]) async -> Int {
        switch part {
        case .part1:
            return 0
        case .part2:
            return 0
        }
    }
}
