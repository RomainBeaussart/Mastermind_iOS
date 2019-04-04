//
//  line.swift
//  MasterMind
//
//  Created by Romain BEAUSSART on 03/04/2019.
//  Copyright © 2019 Romain BEAUSSART. All rights reserved.
//

import Foundation

class Line: CustomStringConvertible {
    var colors = initialLine()
    
    func changeColor(index: Int, color: Color) {
        self.colors[index] = color
    }
    
    class func randomLine() -> Line
    {
        let newLine = Line()
        for i in 0...3 {
            let randomNumber = Int.random(in: 1...6)
            let randomColor = Color(rawValue: randomNumber)
            if randomColor != nil {
                newLine.changeColor(index: i, color: randomColor!)
            }
            
        }
        return newLine
    }
    
    class func initialLine() -> Array<Color>
    {
        return [Color.black, Color.black, Color.black, Color.black]
    }
    
    var description: String {
        return "\(colors[0]) - \(colors[1]) - \(colors[2]) - \(colors[3])"
    }
    
    func wellPlaced(compareTo refline: Line) -> Array<Int>
    {
        var result = [Int]()
        for i in 0...3 {
            if refline.colors[i] == self.colors[i] {
                result.append(i)
            }
        }
        return result
    }
    
    func wrongPositions(compareTo refline: Line) -> Array<Int>
    {
        var result = [Int]()
        var reflineColorsCopy = refline.colors
        for i in 0...3 {
            if reflineColorsCopy.contains(self.colors[i]) && refline.colors[i] != self.colors[i] {
                result.append(i)
                reflineColorsCopy.remove(at: reflineColorsCopy.index(of: self.colors[i])!)
            }
        }
        return result
    }
    
    
    func result(compareTo refline: Line) -> Array<Int>
    {
        let result = [self.wellPlaced(compareTo: refline).count, self.wrongPositions(compareTo: refline).count]
        print("Bien placé \(result[0]), Mal placé \(result[1])")
        return result
    }
    
}

