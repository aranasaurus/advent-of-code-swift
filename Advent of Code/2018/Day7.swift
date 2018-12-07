//
//  Day7.swift
//  Advent of Code
//
//  Created by Ryan Arana on 12/6/18.
//  Copyright © 2018 aranasaurus.com. All rights reserved.
//

import Foundation

extension AdventOfCode2018 {
    struct Day7 {
        class Step: Hashable {
            let id: Character
            var dependents: Set<Step> = Set()
            var requirements: Set<Step> = Set()

            var ready: Bool { return requirements.isEmpty }

            init(_ id: Character) {
                self.id = id
            }

            func perform() {
                for dep in dependents {
                    dep.requirements.remove(self)
                }
            }

            static func == (lhs: AdventOfCode2018.Day7.Step, rhs: AdventOfCode2018.Day7.Step) -> Bool {
                return lhs.id == rhs.id
            }
            func hash(into hasher: inout Hasher) {
                hasher.combine(id)
            }
        }

        static func part1(inputs: String = rawInput) -> String {
            var steps = [Character: Step]()

            // "Step C must be finished before step A can begin."
            let reqIndex = 5
            let depIndex = 36
            for line in inputs.split(separator: "\n").map({ Array($0) }) {
                let dep = steps[line[depIndex], default: Step(line[depIndex])]
                let req = steps[line[reqIndex], default: Step(line[reqIndex])]
                dep.requirements.insert(req)
                req.dependents.insert(dep)
                steps[dep.id] = dep
                steps[req.id] = req
            }

            var stepOrder = ""
            // If more than one step is ready, choose the step which is first alphabetically.
            while let step = steps.values.filter({ $0.ready }).sorted(by: { $0.id < $1.id }).first {
                step.perform()
                steps.removeValue(forKey: step.id)
                stepOrder.append(step.id)
            }
            return stepOrder
        }
    }
}

extension AdventOfCode2018.Day7 {
    static let rawInput: String = """
Step A must be finished before step N can begin.
Step P must be finished before step R can begin.
Step O must be finished before step T can begin.
Step J must be finished before step U can begin.
Step M must be finished before step X can begin.
Step E must be finished before step X can begin.
Step N must be finished before step T can begin.
Step W must be finished before step G can begin.
Step Z must be finished before step D can begin.
Step F must be finished before step Q can begin.
Step U must be finished before step L can begin.
Step I must be finished before step X can begin.
Step X must be finished before step Y can begin.
Step D must be finished before step Y can begin.
Step S must be finished before step K can begin.
Step C must be finished before step G can begin.
Step K must be finished before step V can begin.
Step B must be finished before step R can begin.
Step Q must be finished before step L can begin.
Step T must be finished before step H can begin.
Step H must be finished before step G can begin.
Step V must be finished before step L can begin.
Step L must be finished before step R can begin.
Step G must be finished before step Y can begin.
Step R must be finished before step Y can begin.
Step G must be finished before step R can begin.
Step X must be finished before step V can begin.
Step V must be finished before step Y can begin.
Step Z must be finished before step U can begin.
Step U must be finished before step R can begin.
Step J must be finished before step Y can begin.
Step Z must be finished before step C can begin.
Step O must be finished before step L can begin.
Step C must be finished before step H can begin.
Step V must be finished before step G can begin.
Step F must be finished before step K can begin.
Step Q must be finished before step G can begin.
Step S must be finished before step Q can begin.
Step M must be finished before step G can begin.
Step T must be finished before step L can begin.
Step C must be finished before step Q can begin.
Step T must be finished before step V can begin.
Step W must be finished before step Z can begin.
Step C must be finished before step K can begin.
Step I must be finished before step C can begin.
Step X must be finished before step Q can begin.
Step F must be finished before step X can begin.
Step J must be finished before step S can begin.
Step I must be finished before step K can begin.
Step U must be finished before step Q can begin.
Step I must be finished before step Q can begin.
Step N must be finished before step H can begin.
Step A must be finished before step T can begin.
Step T must be finished before step G can begin.
Step D must be finished before step T can begin.
Step A must be finished before step X can begin.
Step D must be finished before step G can begin.
Step C must be finished before step T can begin.
Step W must be finished before step Q can begin.
Step W must be finished before step K can begin.
Step V must be finished before step R can begin.
Step H must be finished before step R can begin.
Step F must be finished before step H can begin.
Step F must be finished before step V can begin.
Step U must be finished before step T can begin.
Step K must be finished before step H can begin.
Step B must be finished before step T can begin.
Step H must be finished before step Y can begin.
Step J must be finished before step Z can begin.
Step B must be finished before step Y can begin.
Step I must be finished before step V can begin.
Step W must be finished before step V can begin.
Step Q must be finished before step R can begin.
Step I must be finished before step S can begin.
Step E must be finished before step H can begin.
Step J must be finished before step B can begin.
Step S must be finished before step G can begin.
Step E must be finished before step S can begin.
Step N must be finished before step I can begin.
Step Z must be finished before step F can begin.
Step E must be finished before step I can begin.
Step S must be finished before step B can begin.
Step D must be finished before step L can begin.
Step Q must be finished before step T can begin.
Step Q must be finished before step H can begin.
Step K must be finished before step Y can begin.
Step M must be finished before step U can begin.
Step U must be finished before step K can begin.
Step W must be finished before step I can begin.
Step J must be finished before step W can begin.
Step K must be finished before step T can begin.
Step P must be finished before step Y can begin.
Step L must be finished before step G can begin.
Step K must be finished before step B can begin.
Step I must be finished before step Y can begin.
Step U must be finished before step B can begin.
Step P must be finished before step O can begin.
Step O must be finished before step W can begin.
Step O must be finished before step J can begin.
Step A must be finished before step J can begin.
Step F must be finished before step G can begin.
"""
}
