//
//  HomeView.swift
//  ChifoumiTP
//
//  Created by KaayZenn on 22/12/2023.
//

import SwiftUI

struct HomeView: View {
    
    // Custom Type
    @ObservedObject var cm = ChifumiManager.shared
    
    //MARK: - body
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    
                    VStack {
                        Text("PLAYER 1")
                        if let player1Tool = cm.player1Tool {
                            Text(convertToolToEmoji(tool: player1Tool))
                                .font(.system(size: 64))
                        }
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("PLAYER 2")
                        if let player2Tool = cm.player2Tool {
                            Text(convertToolToEmoji(tool: player2Tool))
                                .font(.system(size: 64))
                        }
                    }
                    
                    Spacer()
                }
                Spacer()
                
                Text(cm.nameWinner)
                
                Spacer()
                
                Button(action: { 
                    cm.getToolForPlayers()
                    cm.playRound()
                }, label: {
                    HStack {
                        Spacer()
                        Text("Play a round")
                            .foregroundStyle(Color.white)
                        Spacer()
                    }
                    .padding()
                    .background(Capsule().foregroundStyle(Color.blue))
                })
                .padding(.horizontal)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: {
                        List(cm.allRounds.reversed()) { round in
                            HStack {
                                Text(round.winner)
                                Spacer()
                                Text("P1 : \(convertToolToEmoji(tool: round.player1Tool))")
                                Text(" | ")
                                Text("P2 : \(convertToolToEmoji(tool: round.player2Tool))")
                            }
                        }
                        .navigationBarTitleDisplayMode(.inline)
                    }, label: {
                        Text("Historique")
                    })
                }
            }
            .navigationTitle("Chifoumi")
        }
    } // End body
    
    //MARK: - Fonctions
    func convertToolToEmoji(tool: Tool) -> String {
        if tool == .rock {
            return "🗿"
        } else if tool == .paper {
            return "📄"
        } else {
            return "✂️"
        }
    }
    
} // End struct

//MARK: - Preview
#Preview {
    HomeView()
}

