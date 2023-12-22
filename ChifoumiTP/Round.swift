//
//  Round.swift
//  ChifoumiTP
//
//  Created by KaayZenn on 22/12/2023.
//

import Foundation

enum Tool: CaseIterable {
    case rock
    case paper
    case scissors
}

struct Round: Identifiable {
    var id: UUID = UUID()
    var winner: String
    var player1Tool: Tool
    var player2Tool: Tool
}
