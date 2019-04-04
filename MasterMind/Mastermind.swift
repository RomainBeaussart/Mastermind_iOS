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
    
}
