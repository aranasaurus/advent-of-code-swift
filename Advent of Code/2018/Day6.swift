//
//  Day6.swift
//  Advent of Code
//
//  Created by Ryan Arana on 12/5/18.
//  Copyright © 2018 aranasaurus.com. All rights reserved.
//

import Foundation

extension AdventOfCode2018 {
    struct Day6 {
        struct Location {
            let x: Int
            let y: Int
            var id: String?

            func dist(from other: Location) -> Int {
                return abs(x - other.x) + abs(y - other.y)
            }
        }

        static func part1(inputs: String = rawInput) -> Int {
            var i = 0
            let locations = inputs.split(separator: "\n").compactMap { (s: String.SubSequence) -> Location? in
                var l = Location(string: String(s))
                l?.id = "\(i)"
                i += 1
                return l
            }

            var s = ""
            let sortedByX = locations.sorted(by:{ $0.x < $1.x })
            let sortedByY = locations.sorted(by:{ $0.y < $1.y })
            let minX = sortedByX.first!.x
            let maxX = sortedByX.last!.x
            let minY = sortedByY.first!.y
            let maxY = sortedByY.last!.y

            var grid: [Int: [Int: Location]] = [:]
            for loc in locations {
                grid[loc.y - minY, default: [:]][loc.x - minX] = loc
            }

            var rowsOfIDs: [[String]] = []
            for y in 0...maxY-minY {
                var r = Array<String>(repeating: ".", count: maxX - minX + 1)
                for x in 0...maxX-minX {
                    if let loc = grid[y]?[x] {
                        s.append("[\(loc.id ?? "*")]\t")
                        r[x] = loc.id ?? "*"
                        continue
                    }

                    let loc = Location(x: x+minX, y: y+minY, id: nil)

                    guard let d = locations.min(by: { loc.dist(from: $0) < loc.dist(from: $1) }) else { continue }

                    let dist = loc.dist(from: d)
                    let shortest = locations.filter({ loc.dist(from: $0) == dist })
                    s.append("\(shortest.count == 1 ? d.id ?? "!" : ".")\t")
                    r[x] = shortest.count == 1 ? d.id ?? "!" : "."
                }
                s.append("\n")
                rowsOfIDs.append(r)
            }
            print(s)
            var areasById: [Int: Int] = [:]
            for row in rowsOfIDs {
                for id in row {
                    guard id != row.first!, id != row.last!, let i = Int(id) else { continue }
                    areasById[i, default: 0] += 1
                }
            }

            return areasById.max(by: { $0.value < $1.value })?.value ?? 0
        }
    }
}

extension AdventOfCode2018.Day6.Location {
    init?(string: String) {
        let coords = string.split(separator: ",")
        guard coords.count == 2, let x = Int(coords[0]), let y = Int(coords[1].trimmingCharacters(in: .whitespaces)) else {
            return nil
        }
        self.init(x: x, y: y, id: nil)
    }
}

extension AdventOfCode2018.Day6 {
    static let rawInput: String = """
174, 356
350, 245
149, 291
243, 328
312, 70
327, 317
46, 189
56, 209
84, 60
308, 202
289, 331
201, 139
354, 201
283, 130
173, 144
110, 280
242, 250
196, 163
217, 300
346, 188
329, 225
112, 275
180, 190
255, 151
107, 123
86, 304
236, 88
313, 124
297, 187
203, 289
104, 71
100, 151
227, 47
318, 293
268, 225
116, 49
222, 125
261, 146
47, 117
119, 214
183, 242
136, 210
91, 300
326, 237
144, 273
300, 249
200, 312
305, 50
235, 265
322, 291
"""
}
