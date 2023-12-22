//
//  ChifoumiTPTests.swift
//  ChifoumiTPTests
//
//  Created by KaayZenn on 22/12/2023.
//

import XCTest

final class ChifoumiTPTests: XCTestCase {
    private var sut: ChifumiManager!

    override func setUpWithError() throws {
        sut = ChifumiManager()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_playersHaveTools() {
        sut.getToolForPlayers()
        
        XCTAssertTrue(sut.player1Tool != nil)
    }

    func test_addInHistory() {
        sut.getToolForPlayers()
        sut.playRound()
        
        XCTAssertEqual(sut.allRounds.count, 1)
    }
    
    func test_playRound() {
        sut.player1Tool = Tool.rock
        sut.player2Tool = Tool.paper
        
        sut.playRound()
        
        XCTAssertEqual(sut.nameWinner, "Player2 WIN")
    }

}
