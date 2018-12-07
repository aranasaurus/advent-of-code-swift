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
        struct Location: Hashable, Equatable {
            let x: Int
            let y: Int
            var area: Int = 1

            init?(string: String) {
                let coords = string.split(separator: ",")
                guard coords.count == 2, let x = Int(coords[0]), let y = Int(coords[1].trimmingCharacters(in: .whitespaces)) else {
                    return nil
                }
                self.init(x, y)
            }

            init(_ x: Int, _ y: Int) {
                self.x = x
                self.y = y
            }

            func dist(from other: Location) -> Int {
                return abs(x - other.x) + abs(y - other.y)
            }

            func dist<T: Collection>(from all: T) -> Int where T.Element == Location {
                return all.reduce(0) { return $0 + self.dist(from: $1) }
            }

            func hash(into hasher: inout Hasher) {
                hasher.combine(x)
                hasher.combine(y)
            }

            static func ==(a: Location, b: Location) -> Bool {
                return a.x == b.x && a.y == b.y
            }
        }

        class Grid {
            // Parse input and find the bounds of the locations.
            var minX = Int.max
            var maxX = Int.min
            var minY = Int.max
            var maxY = Int.min
            var locations = Set<Location>()
            var infinites = Set<Location>()

            init(inputs: String) {
                for line in inputs.split(separator: "\n").enumerated() {
                    guard let location = Location(string: String(line.element)) else { continue }
                    minX = min(location.x, minX)
                    maxX = max(location.x, maxX)
                    minY = min(location.y, minY)
                    maxY = max(location.y, maxY)
                    locations.insert(location)
                }
            }

            func calcInfinites() {
                for x in minX...maxX {
                    var loc = Location(x, minY)
                    if let closest = locations.min(by: { $0.dist(from: loc) < $1.dist(from: loc) }) {
                        infinites.insert(closest)
                    }

                    loc = Location(x, maxY)
                    if let closest = locations.min(by: { $0.dist(from: loc) < $1.dist(from: loc) }) {
                        infinites.insert(closest)
                    }
                }
                for y in minY...maxY {
                    var loc = Location(minX, y)
                    if let closest = locations.min(by: { $0.dist(from: loc) < $1.dist(from: loc) }) {
                        infinites.insert(closest)
                    }

                    loc = Location(maxX, y)
                    if let closest = locations.min(by: { $0.dist(from: loc) < $1.dist(from: loc) }) {
                        infinites.insert(closest)
                    }
                }
            }
        }

        static func part1(inputs: String = rawInput) -> Int {
            // Parse input and find the bounds of the locations.
            let grid = Grid(inputs: inputs)

            grid.calcInfinites()
            
            // Calculate areas of each point within the maximums
            for y in grid.minY+1...grid.maxY-1 {
                for x in grid.minX+1...grid.maxX-1 {
                    let loc = Location(x, y)
                    // Skip edges (infinite area) and the locations themselves (their origin is counted in their area
                    // as they are parsed).
                    guard !grid.infinites.contains(loc) && !grid.locations.contains(loc) else { continue }

                    // Get the closest Location to this point
                    guard var closest = grid.locations.min(by: { loc.dist(from: $0) < loc.dist(from: $1) }) else { continue }

                    // Make sure there are no other Locations equidistant from this point.
                    let dist = loc.dist(from: closest)
                    if let _ = grid.locations.first(where: { $0 != closest && loc.dist(from: $0) == dist }) {
                        continue
                    }
                    closest.area += 1
                    grid.locations.update(with: closest)
                }
            }
            return grid.locations.max(by: { $0.area < $1.area })?.area ?? 0
        }

        static func part2(inputs: String = rawInput, range: Int = 10_000) -> Int {
            // TODO :P
            return 0
        }
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
