//
//  Day9.swift
//  Advent of Code
//
//  Created by Ryan Arana on 12/11/18.
//  Copyright © 2018 aranasaurus.com. All rights reserved.
//

import Foundation

extension AdventOfCode2018 {
    struct Day9 {
        static func part1(inputs: String = rawInput) -> Int {
            let inputNumbers = inputs.split(separator: " ").compactMap({ Int($0) })
            var scores = Array<Int>(repeating: 0, count: inputNumbers[0])
            let lastMarble = inputNumbers[1]
            var availableMarbles = Array(1...lastMarble)
            var playedMarbles = [0]

            var player = scores.startIndex
            var currentMarbleIndex = playedMarbles.startIndex
            while availableMarbles.count > 0 {
                let nextMarble = availableMarbles.removeFirst()
                defer {
                    player += 1
                    if player == scores.endIndex {
                        player = scores.startIndex
                    }
                }

                guard nextMarble % 23 == 0 else {
                    var targetIndex = currentMarbleIndex.advanced(by: 1)
                    if targetIndex >= playedMarbles.endIndex {
                        targetIndex -= playedMarbles.endIndex
                    }
                    currentMarbleIndex = playedMarbles.index(after: targetIndex)
                    playedMarbles.insert(nextMarble, at: currentMarbleIndex)
                    continue
                }

                scores[player] += nextMarble
                var removalIndex = currentMarbleIndex - 7
                while removalIndex < playedMarbles.startIndex {
                    removalIndex += playedMarbles.endIndex
                }
                scores[player] += playedMarbles.remove(at: removalIndex)
                currentMarbleIndex = removalIndex
            }
            return scores.max() ?? 0
        }
    }
}

extension AdventOfCode2018.Day9 {
    static let rawInput: String = "455 players; last marble is worth 71223 points"
}
