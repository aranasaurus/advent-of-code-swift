//
//  Entry2021Day16.swift
//  AdventOfCode
//
//  Created by Ryan Arana on 12/21/21.
//

import Foundation
import Collections

class Entry2021Day16: Entry {
    init(_ part: Part) {
        super.init(year: 2021, day: 16, part: part)
    }

    @Sendable override func run() async throws {
        let input = try String(contentsOf: try fileURL())

        let answer = run(for: input)
        DispatchQueue.main.async {
            self.answer = "\(answer)"
        }
    }

    func run(for input: String) -> Int {
        switch part {
        case .part1:
            return 0
        case .part2:
            return 0
        }
    }
}

extension Entry2021Day16 {
    struct Packet: Equatable {
        var version: Int
        var type: PacketType

        init(version: Int, type: PacketType) {
            self.version = version
            self.type = type
        }

        init?(_ string: String) {
            /*
             The BITS transmission contains a single packet at its outermost layer which itself contains many
             other packets. The hexadecimal representation of this packet might encode a few extra 0 bits at
             the end; these are not part of the transmission and should be ignored.

             Every packet begins with a standard header: the first three bits encode the packet version, and
             the next three bits encode the packet type ID. These two values are numbers; all numbers encoded
             in any packet are represented as binary with the most significant bit first. For example, a
             version encoded as the binary sequence 100 represents the number 4.
             */
            let bin = Packet.expandHexToBin(string)
            let headerStart = bin.startIndex
            let versionEnd = bin.index(headerStart, offsetBy: 3)
            let typeIDEnd = bin.index(versionEnd, offsetBy: 3)
            guard
                let version = Int(bin[headerStart..<versionEnd], radix: 2),
                let typeID = Int(bin[versionEnd..<typeIDEnd], radix: 2)
            else { return nil }

            self.version = version

            let payloadBits = String(bin[typeIDEnd...])
            self.type = PacketType(typeID: typeID, payloadBits: payloadBits)
        }
    }

    enum PacketType: Equatable {
        case literal(value: Int)
        case lengthOperator(length: Int, payload: [Packet])
        case containerOperator(packetCount: Int, payload: [Packet])

        init(typeID: Int, payloadBits: String) {
            switch typeID {
            case 4:
                /*
                 Packets with type ID 4 represent a literal value. Literal value packets encode a single binary
                 number. To do this, the binary number is padded with leading zeroes until its length is a
                 multiple of four bits ...
                 */
                var payloadString = payloadBits
                while payloadString.count % 4 != 0, payloadString.last == Character("0") {
                    payloadString.removeLast()
                }

                /*
                 ... and then it is broken into groups of four bits. Each group is prefixed
                 by a 1 bit except the last group, which is prefixed by a 0 bit. These groups of five bits
                 immediately follow the packet header
                 */
                var payload = ""
                for i in stride(from: 0, to: payloadString.count - 4, by: 5) {
                    // skip the first bit, it flags whether or not this set of bits is the last set of bits,
                    // which is information I don't _think_ we need
                    let start = payloadString.index(payloadString.startIndex, offsetBy: i + 1)
                    let end = payloadString.index(payloadString.startIndex, offsetBy: i + 5)
                    payload.append(String(payloadString[start..<end]))
                }
                self = .literal(value: Int(payload, radix: 2)!)
            default:
                // TODO: Actually parse things to figure out which kind of operator we are.
                self = .lengthOperator(length: 0, payload: [])
            }
        }
    }
}

extension Entry2021Day16.Packet {
    static func expandHexToBin(_ hex: String) -> String {
        hex.map {
            switch $0 {
            case "0":
                return "0000"
            case "1":
                return "0001"
            case "2":
                return "0010"
            case "3":
                return "0011"
            case "4":
                return "0100"
            case "5":
                return "0101"
            case "6":
                return "0110"
            case "7":
                return "0111"
            case "8":
                return "1000"
            case "9":
                return "1001"
            case "A":
                return "1010"
            case "B":
                return "1011"
            case "C":
                return "1100"
            case "D":
                return "1101"
            case "E":
                return "1110"
            case "F":
                return "1111"
            default:
                return ""
            }
        }.joined()
    }
}
