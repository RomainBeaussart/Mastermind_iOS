//
//  Mastermind.swift
//  MasterMind
//
//  Created by Romain BEAUSSART on 29/03/2019.
//  Copyright © 2019 Romain BEAUSSART. All rights reserved.
//

import Foundation

class Mastermind {
    var testLine = Line()
    
    func writeGame() {
        print(self.testLine)
        testLine = Line.randomLine()
        print(self.testLine)
    }
    
    
}
