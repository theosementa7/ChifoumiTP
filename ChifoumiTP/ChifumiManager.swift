//
//  ChifumiManager.swift
//  ChifoumiTP
//
//  Created by KaayZenn on 22/12/2023.
//

import Foundation

class ChifumiManager: ObservableObject {
    static let shared = ChifumiManager()
    
    @Published var allRounds: [Round] = []
    
    @Published var player1Tool: Tool? = nil
    @Published var player2Tool: Tool? = nil
    
    @Published var nameWinner: String = ""
}

extension ChifumiManager {
    
    func getToolForPlayers() {
        player1Tool = Tool.randomElement()
        player2Tool = Tool.randomElement()
    }
    
    func playRound() {        
        if player1Tool == player2Tool {
            nameWinner = "EQUALITY"
        } else if player1Tool == .rock && player2Tool == .scissors {
            nameWinner = "Player1 WIN"
        } else if player1Tool == .paper && player2Tool == .rock {
            nameWinner = "Player1 WIN"
        } else if player1Tool == .scissors && player2Tool == .paper {
            nameWinner = "Player1 WIN"
        } else {
            nameWinner = "Player2 WIN"
        }
        
        let round = Round(
            winner: nameWinner,
            player1Tool: player1Tool!,
            player2Tool: player2Tool!
        )
        
        allRounds.append(round)
    }
    
}

//MARK: - Extension
extension CaseIterable {
    static func randomElement() -> AllCases.Element {
        guard Self.allCases.count > 0 else {
            fatalError("There must be at least one case in the enum")
        }
        return Self.allCases.randomElement()!
    }
}

