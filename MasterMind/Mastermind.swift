//
//  Mastermind.swift
//  MasterMind
//
//  Created by Romain BEAUSSART on 29/03/2019.
//  Copyright © 2019 Romain BEAUSSART. All rights reserved.
//

import Foundation

class Mastermind {
    private var correctLine: Line
    private var historygame: Array<Line>
    private var startDate: Date
    
    private struct Game {
        private let time: String
        private let hits: String
        private let score: String
        private let historyGame: [Line]
    }
    
    init(correctAnswer: Line) {
        self.correctLine = correctAnswer
        self.historygame = []
        self.startDate = Date()
    }
    
    init() {
        self.correctLine = Line.randomLine()
        self.historygame = []
        self.startDate = Date()
        print("\(self.correctLine)")
    }
    
    func verif(line: Line) -> [Int]{
        self.historygame.append(line)
        return correctLine.result(compareTo: line)
    }
    
    func getScore() -> Int {
        return historygame.count * 10 + Int(startDate.timeIntervalSince(Date()))
    }
    
    func save() {
        
        //Does'nt work
        
        let path = Bundle.main.path(forResource: "scored", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        let dict = NSMutableDictionary()
        dict.setValue("\(self.startDate.timeIntervalSince(Date()))", forKey: "time")
        dict.setValue("\(self.historygame.count)", forKey: "hits")
        dict.setValue("\(self.getScore())", forKey: "score")
        dict.setValue(self.historygame, forKey: "historyGame")
        
        dict.write(to: url, atomically: true)
        
        print("Saved")
        
    }
    
}
