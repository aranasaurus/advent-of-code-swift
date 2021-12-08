//
//  Entry2021Day08.swift
//  AdventOfCode
//
//  Created by Ryan Arana on 12/8/21.
//

import Foundation

class Entry2021Day08: Entry {
    init(_ part: Part) {
        super.init(year: 2021, day: 8, part: part)
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
        progress.totalUnitCount = Int64(input.count)

        switch part {
        case .part1:
            return input.reduce(0) { result, line in
                defer { progress.completedUnitCount += 1 }

                let sides = line.split(separator: "|")
                let sequences = sides[0].split(separator: " ")
                    .map { String($0.sorted()) }
                let outputs = sides[1].split(separator: " ")
                    .map { String($0.sorted()) }

                guard
                    let one = sequences.first(where: { $0.count == 2 }),
                    let four = sequences.first(where: { $0.count == 4 }),
                    let seven = sequences.first(where: { $0.count == 3 }),
                    let eight = sequences.first(where: { $0.count == 7 })
                else { return result }

                let digits = [one, four, seven, eight]
                return digits.reduce(result) { occurrences, digit in
                    occurrences + outputs
                        .filter { $0 == digit }
                        .count
                }
            }
        case .part2:
            return 0
        }
    }
}

//extension Entry2021Day08 {
//    struct DigitLegend {
//        init?<AnyString: StringProtocol>(line: AnyString) {
//            guard let sequences = line.split(separator: "|").first?.split(separator: " ") else { return nil }
//        }
//    }
//}