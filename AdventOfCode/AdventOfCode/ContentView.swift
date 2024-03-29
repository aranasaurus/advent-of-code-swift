//
//  ContentView.swift
//  AdventOfCode
//
//  Created by Ryan Arana on 10/29/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                year2021

                Divider()
                    .padding(.horizontal)

                year2020
            }
            .padding()
        }
        .frame(minWidth: 300)
    }

    @ViewBuilder private var year2021: some View {
        Text("2021")
            .font(.title)

        Divider()
            .padding(.horizontal)

        VStack {
            Group {
                EntryView(entry: Entry2021Day17(.part1))
                EntryView(entry: Entry2021Day17(.part2))
                EntryView(entry: Entry2021Day16(.part1))
                EntryView(entry: Entry2021Day16(.part2))
            }

            Group {
                EntryView(entry: Entry2021Day15(.part1))
                EntryView(entry: Entry2021Day15(.part2))
                EntryView(entry: Entry2021Day14(.part1))
                EntryView(entry: Entry2021Day14(.part2))
                EntryView(entry: Entry2021Day13(.part1))
                EntryView(entry: Entry2021Day13(.part2))
                EntryView(entry: Entry2021Day12(.part1))
                EntryView(entry: Entry2021Day12(.part2))
                EntryView(entry: Entry2021Day11(.part1))
                EntryView(entry: Entry2021Day11(.part2))
            }

            Group {
                EntryView(entry: Entry2021Day10(.part1))
                EntryView(entry: Entry2021Day10(.part2))
                EntryView(entry: Entry2021Day09(.part1))
                EntryView(entry: Entry2021Day09(.part2))
                EntryView(entry: Entry2021Day08(.part1))
                EntryView(entry: Entry2021Day08(.part2))
                EntryView(entry: Entry2021Day07(.part1))
                EntryView(entry: Entry2021Day07(.part2))
                EntryView(entry: Entry2021Day06(.part1))
                EntryView(entry: Entry2021Day06(.part2))
            }

            Group {
                EntryView(entry: Entry2021Day05(.part1))
                EntryView(entry: Entry2021Day05(.part2))
                EntryView(entry: Entry2021Day04(.part1))
                EntryView(entry: Entry2021Day04(.part2))
                EntryView(entry: Entry2021Day03(.part1))
                EntryView(entry: Entry2021Day03(.part2))
                EntryView(entry: Entry2021Day02(.part1))
                EntryView(entry: Entry2021Day02(.part2))
                EntryView(entry: Entry2021Day01(.part1))
                EntryView(entry: Entry2021Day01(.part2))
            }
        }
    }

    @ViewBuilder private var year2020: some View {
        Text("2020")
            .font(.title)

        Divider()
            .padding(.horizontal)

        VStack {
            Group {
                EntryView(entry: Entry2020Day01(.part1))
                EntryView(entry: Entry2020Day01(.part2))
                EntryView(entry: Entry2020Day02(.part1))
                EntryView(entry: Entry2020Day02(.part2))
                EntryView(entry: Entry2020Day03(.part1))
                EntryView(entry: Entry2020Day03(.part2))
                EntryView(entry: Entry2020Day04(.part1))
                EntryView(entry: Entry2020Day04(.part2))
                EntryView(entry: Entry2020Day05(.part1))
                EntryView(entry: Entry2020Day05(.part2))
            }

            Group {
                EntryView(entry: Entry2020Day06(.part1))
                EntryView(entry: Entry2020Day06(.part2))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(width: 340)
    }
}
