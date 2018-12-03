//
//  Day2.swift
//  Advent of Code
//
//  Created by Ryan Arana on 12/2/18.
//  Copyright © 2018 aranasaurus.com. All rights reserved.
//

import Foundation

extension AdventOfCode2018 {
    struct Day2 {
        struct ScanResult: Equatable {
            var hasDoubles: Bool = false
            var hasTriples: Bool = false
        }

        static func part1(inputs: String = rawInput) -> Int{
            var doubles = 0
            var triples = 0
            for line in inputs.split(separator: "\n") {
                let lineCounts = scan(line)
                doubles += lineCounts.hasDoubles ? 1 : 0
                triples += lineCounts.hasTriples ? 1 : 0
            }
            return doubles * triples
        }

        static func scan<T: StringProtocol>(_ line: T) -> ScanResult {
            var counts: [Character: Int] = [:]
            for char in line {
                counts[char, default: 0] += 1
            }

            return ScanResult(
                hasDoubles: counts.values.contains(2),
                hasTriples: counts.values.contains(3)
            )
        }
    }
}

extension AdventOfCode2018.Day2 {
    static let rawInput: String = """
revtoubfniyhzsgxdowjwkqglp
revtcgbfniyhzsvxdomjwkqmlp
cevtcubfniyhqsgxdoakwkqmlp
revtcubfniyhzsgxdtavwkqmep
reutcuboniyhzmgxdoajwkqmlp
revtcubfniyhzsgxxqajmkqmlp
rwvtcvbfniyhzsgxdozjwkqmlp
qevtcbbfniyhzsgxdoljwkqmlp
rnvtcmbfniyhzsuxdoajwkqmlp
revtcubfsiyhzsgxdaaewkqmlp
revtcubfpiyhesgxhoajwkqmlp
revtcubfnivhzsuxdoljwkqmlp
retpcubwniyhzsgxdoajwkqmlp
revrcubfniyhzsgxdyajhkqmlp
revtcbbfniyhzsixdoajwvqmlp
revtcubfniyhzsgxdoanmkqmpp
jevtoubfnuyhzsgxdoajwkqmlp
rpwtcubfniehzsgxdoajwkqmlp
revhcubfniyhnsgxdoajwkxmlp
revtcubfniyhzswxdodjwkqvlp
reotcubfciyhzsgxdnajwkqmlp
revtcubfniyhzsgxdbatwsqmlp
rlvbcubfniyhzssxdoajwkqmlp
rentcubfnyyhzsgxdozjwkqmlp
revtcuufniyhasgxdohjwkqmlp
jevtcubfniyhxsgxdoajwkqwlp
ravtcubfnryhzfgxdoajwkqmlp
reltcubfnvyhzsgxdoajwkumlp
revtrubfnschzsgxdoajwkqmlp
uevtcubanichzsgxdoajwkqmlp
revtcubfniyhzdpxdoajwwqmlp
revtcubfhiyhzsgxdoajgkqplp
revtcubfniyxzygxdoajwkqmld
revtcunfniyfzsgxdoajwkqwlp
reqtcubfniyhzsgxdoajwfqmlj
revtcubfniyhzagedaajwkqmlp
revthuefniyhzsgxroajwkqmlp
revtcrbfodyhzsgxdoajwkqmlp
revtcubfniyhxsgxdlajwuqmlp
revtrubfnirhzsgxdokjwkqmlp
revtiubfniyhzagudoajwkqmlp
jevtcubfniyhusgxsoajwkqmlp
reetcubfniyhzsgxdoajvmqmlp
pestcubfniyhzsgxdoajwkqglp
revtcubfniyhzsgxdoiowkqalp
revscubfniyhzsgxdoajwkoplp
revtcubfnoyhzsgxdlajwkymlp
rkvtcubfniyhzsgxdoajzkqhlp
revtuubfniyhzsgxdojjwkqglp
revtcubmniyhzsgydoajwkzmlp
revtcybfnijhzsgxvoajwkqmlp
rxftcubfnkyhzsgxdoajwkqmlp
gertcubfniyhzsgxjoajwkqmlp
revtcabfniygzdgxdoajwkqmlp
levgcubfniyhzsgxdoalwkqmlp
revtcubfniyhzslxdofjwkqxlp
revtcybwniyhzsgxdoajwkqmlx
devtcubpniyhzsgqdoajwkqmlp
pevtcjbfniyhzsbxdoajwkqmlp
revtcubfeiehzsgxdoafwkqmlp
revwcubfniyhzsgxdoawekqmlp
revtcubfniyussgxdoawwkqmlp
revtcuafnczhzsgxdoajwkqmlp
revtaubfniyhusgxdoajwkqilp
revtcubfnidhzxgxdoajwkqmlt
revtcubfniyhzsexdmajwnqmlp
revtcubfnhyhzsgxdwxjwkqmlp
revtalbfniyhzsgxdoajwbqmlp
revtcubfniyazsgxdoajwkqcvp
rcvtcubfniyhzwgxdoajwkqmsp
revthubfniyhzxgxdoalwkqmlp
revtcubfniyazsoxgoajwkqmlp
revtcubkriyhzsgtdoajwkqmlp
revtcubfniyhzsgxgeajwgqmlp
heftcubfniypzsgxdoajwkqmlp
revtclbfniyhzsgxdowjnkqmlp
revtcubfnifhzsgxdoamwkqmhp
revncubfniyhzsgxdoxjwiqmlp
reitcurfniyhzsgxdoajwkrmlp
revtfmbfniyhzsgxdoajwkqmbp
revtcubfniahzsgxdoajwkqhtp
rejtcubfhiyhzsgxdoajwkqmfp
revtcuxfqiyhzsgxdoajwkqmlh
revtcuzfniwhzsgxdoajwkqmcp
revtcubfniyhzsmxdotjwkqmlx
revtcubfniyhzzgxmoajwkqulp
revtcuaffiyhzsgxdoajwkqmlj
revtcxbfniyhzsaxdoajwkqflp
revtjubfniyhzcrxdoajwkqmlp
revtcunfniyhzsgxdfajwoqmlp
revtcubfpiytzswxdoajwkqmlp
revtcubfniyhzsgxdorjwiqmtp
oevtcubfniyhzsgidoajwkqmlt
revccubzniyhztgxdoajwkqmlp
reircubfniwhzsgxdoajwkqmlp
revtcubfniyhzsgxhyajwkqvlp
revtcubfnpyhzsgxdoajwkvblp
revtduvfniyhzsixdoajwkqmlp
revtcebfniyhzsgydpajwkqmlp
revtcubftiyhzsgxwkajwkqmlp
revtcdbfniyuzsgxdoajlkqmlp
revtcubfnvydjsgxdoajwkqmlp
cevtcupfniypzsgxdoajwkqmlp
revtcubfniyhzsgoeonjwkqmlp
revtcsbfniyhzsgxdoyjwdqmlp
revtcubfriyhzugxdoakwkqmlp
revtcadfniohzsgxdoajwkqmlp
revrcubfniyhzsguxoajwkqmlp
ruvtcubfniyhzsxxdoahwkqmlp
aevtcubfniyhzsgcdoajwkqdlp
revtcubgniyhzwgxdoajpkqmlp
revtcubfniyhzegxdoajwkumsp
rlvtcubzniyhzsgxdoajwkqzlp
revtfubfniyhzxgbdoajwkqmlp
revtcubfniyszssxdoajwkymlp
revtcubfniyhzsgxdoarskzmlp
rewtcubfniyhzsgxdoajwkpmlh
revtcubbniyhzsfxdxajwkqmlp
yeitcubfniyhzsgxdrajwkqmlp
revtcubfniyhzsrxnoajwkemlp
revtcuefnqyhzsgxdoajwkqmbp
revtcubfniyhzsuxdoajwdqnlp
revtcujfnifhzsgxdoaswkqmlp
revtcuyfniyhzsgxdoaswklmlp
reeacubfniyhzsgxdoajwkqmfp
revtcubvniyhzsgxdoauwkqmls
revtpubkniyhzsgxdoajvkqmlp
revtcubfnpyhzsgxdoavnkqmlp
revtcobfnvyhzsfxdoajwkqmlp
gevtcubfniyhzsgxcoajwkqmld
rivtcubfniyhzqgxdpajwkqmlp
rettgubfngyhzsgxdoajwkqmlp
revtcuhfccyhzsgxdoajwkqmlp
rertarbfniyhzsgxdoajwkqmlp
rhftcybfniyhzsgxdoajwkqmlp
revtcvjfniyhzsgxboajwkqmlp
reetcubfnikhzsgxdoajwkqmsp
revtwubfniyhusgxdoajwkqelp
revtcdbfniyyzsgxdwajwkqmlp
revtcurfniyhzsgxduajwkqmtp
revtcuafneyhzsgxduajwkqmlp
rpvtcubfziyhzsgxdoajwkqmep
mevtcubfniyhzssxdoaywkqmlp
reptcubfniypzsgsdoajwkqmlp
revtcubfniyhnsgxdoajwcqelp
revtcutfniyhzsdxdoajwkqmlr
rpvtcuafniyhzsgxqoajwkqmlp
revncubfniyhzsgxdoajwkqkpp
rertcabfniyhzsgxdoejwkqmlp
revockbfniymzsgxdoajwkqmlp
revtsubfniyczsgxdoajwkqplp
revrcubpniyhzbgxdoajwkqmlp
revrculfniyhzsgxdoajwkrmlp
revtlubfniyhzsgxdiajhkqmlp
ravtcubfniyhzsgxdoajwftmlp
revtcunfxiyhzssxdoajwkqmlp
revscubfniypzsgxroajwkqmlp
mevtzubfniyhysgxdoajwkqmlp
reitcubfniyuzogxdoajwkqmlp
revycubfniyhwsgxdoajwkqmlg
revtcubfnyyhzsgxdoajwkomqp
zevtcutfniyhzsgxcoajwkqmlp
revtwubfniylzsgxdjajwkqmlp
oevtcubfniyhzsgxdoaowkzmlp
revtcubfniyhzsgxdxajwwqclp
revtcuafniyhzsgxdlacwkqmlp
revtcubfniyhzsgxdqrjlkqmlp
revmcubfnvyhzsgxduajwkqmlp
rgvvcubfniyhzxgxdoajwkqmlp
revtcubfniyhzsgxdoakwiqmlz
reztcubfniyhzsgxddajwnqmlp
revtcrbfnayhzsgxdoajwxqmlp
revtcuboncyxzsgxdoajwkqmlp
revtczbfniybxsgxdoajwkqmlp
yevtcubfniyhcsdxdoajwkqmlp
reztcmbfniyhzsgxcoajwkqmlp
restcubfliyhzsbxdoajwkqmlp
restcubkniyhzsgxdomjwkqmlp
reokhubfniyhzsgxdoajwkqmlp
rejtiubfniyhzsnxdoajwkqmlp
revtcubfuiyjzsgxdoajykqmlp
revscubfniyhzsixdoajwkqhlp
revtjuzfniyhzsgxdoajwkqilp
revtcubfziyhzsgxdoajhgqmlp
revtcubiniyhzsgldoacwkqmlp
revtcubfngyhisgxdoajwkqmkp
ruvtcubfniyhzsgxloajwkqplp
rtvtcubfniqbzsgxdoajwkqmlp
revtcubfniyhzegxdffjwkqmlp
revtcumsniyhzsgxdoajwkqmsp
rmvtcubfnhyhzsgxsoajwkqmlp
revtcbbfniyhzsgxdoajwkqzgp
rebtcjufniyhzsgxdoajwkqmlp
rephcubfniyhzvgxdoajwkqmlp
revtcpbfniyxzsgxdoajwkqmls
revjcubfniyizsgxdoajwkqmcp
revtcuqfniyhzsgxdoavwkqmdp
rettcubfniyhzsgxdoojwkqmbp
rkvtcubfmuyhzsgxdoajwkqmlp
revtcubcniyhzngxdoajlkqmlp
revxcubfpiyfzsgxdoajwkqmlp
revtcubfniyhzsgkkoajwklmlp
revtcubfniyhzsbxdoajwqqslp
zecycubfniyhzsgxdoajwkqmlp
revtcubfniyhzsggaoajwksmlp
revtcubffiyhzspxdoajwkqmmp
ruvtcubfniyhzsgxdoajwkamlu
revtcubfnmyhzsgxjoajwuqmlp
revtcubfniyhisgxdoajwkqjgp
revthubfniyhzsgxdoajwkeolp
ryvtgubfniyhzsgidoajwkqmlp
reitiubfniyhzsgxdoajwkqmbp
rektcubfniyhzsfxdoajpkqmlp
revbcubfniykzsgxdoajwkqwlp
revzyubfniyhzkgxdoajwkqmlp
ravtcubfniyhzsgxdoajwkhmap
revtcubfnfyhzsgxdvpjwkqmlp
rhvtcnbfnibhzsgxdoajwkqmlp
revtctbfniywzsgxroajwkqmlp
revtcubfniyhzsfmdoabwkqmlp
sevtcubfniynzsgxpoajwkqmlp
revtcnbfniyhzzgxdoajwzqmlp
revtcoofniyhzsgxdoajwkqmrp
revtcubfaiynysgxdoajwkqmlp
revtlubfniyizsnxdoajwkqmlp
revtcubfnwyzzsgxdoajwkqmzp
revtqubfjiyhzsgxdoajwkrmlp
revtaubfniyhpsgxdoajwkqilp
revncuufniwhzsgxdoajwkqmlp
revtcubfngyhisgxdoauwkqmlp
revtcubynqyhzdgxdoajwkqmlp
revtcubfniykzsgxdoyjwkqmla
revttubfniytzsghdoajwkqmlp
rerzcujfniyhzsgxdoajwkqmlp
revtcubtniydzsgxdoajwkpmlp
revecubfniyhzsvxsoajwkqmlp
revtcuvfniyhzsgsdaajwkqmlp
revtcubfniyxzsgxdoajtkzmlp
revtcukfxiyhzsgxdofjwkqmlp
revtcubfnayhzugxdqajwkqmlp
revtcbbfniyizsgxdoajwkqmop
revtcubfnzyhzsgxdoajwoqmpp
reitcnbfniyqzsgxdoajwkqmlp
rektcubfniyhzsgxdgijwkqmlp
revtcubfniyhpsaxdoajdkqmlp
ckvtcubfniyhzsgxeoajwkqmlp
revtcubfniyhzsgxdhajzknmlp
revscubfniyhrsgxdoajwwqmlp
revtcubfilyhzsgxdpajwkqmlp
fevtcubyniyhzsgxdoajwkqmpp
"""
}
