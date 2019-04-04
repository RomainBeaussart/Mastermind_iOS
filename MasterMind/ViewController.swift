//
//  ViewController.swift
//  MasterMind
//
//  Created by Romain BEAUSSART on 28/03/2019.
//  Copyright © 2019 Romain BEAUSSART. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Mastermind()
    
    private var lineNumber = 0
    
    private var push = false
    
    @IBOutlet var allBlocks: [UIButton]!
    
    @IBOutlet var blockd: [UIButton]!
    
    @IBOutlet var blocks1: [UIButton]!
    @IBOutlet var blocks2: [UIButton]!
    @IBOutlet var blocks3: [UIButton]!
    @IBOutlet var blocks4: [UIButton]!
    @IBOutlet var blocks5: [UIButton]!
    @IBOutlet var blocks6: [UIButton]!
    @IBOutlet var blocks7: [UIButton]!
    @IBOutlet var blocks8: [UIButton]!
    @IBOutlet var blocks9: [UIButton]!
    @IBOutlet var blocks10: [UIButton]!
    @IBOutlet var blocks11: [UIButton]!
    @IBOutlet var blocks12: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for b in allBlocks {
            b.layer.cornerRadius = 15
        }
        
        for b in blockd {
            b.layer.cornerRadius = 25
        }
    }
    
    @IBAction func blockTouched(_ sender: UIButton) {
        changeColor (ofBlock: sender)
    }
    
    @IBAction func sendResult(_ sender: UIButton) {
        validBlockColors()
    }
    
    func changeColor (ofBlock thisBlock: UIButton) {
        let thisColor = thisBlock.backgroundColor!
        
        switch thisColor {
        case UIColor.black:
            thisBlock.backgroundColor = UIColor.red
        case UIColor.red:
            thisBlock.backgroundColor = UIColor.green
        case UIColor.green:
            thisBlock.backgroundColor = UIColor.blue
        case UIColor.blue:
            thisBlock.backgroundColor = UIColor.yellow
        case UIColor.yellow:
            thisBlock.backgroundColor = UIColor.magenta
        case UIColor.magenta:
            thisBlock.backgroundColor = UIColor.orange
        case UIColor.orange:
            thisBlock.backgroundColor = UIColor.red
        default:
            thisBlock.backgroundColor = UIColor.black
        }
    }
    
    func validBlockColors(){
        var colors = ""
        let line = Line()
        var i = 0
        var correctLine = true
        for b in blockd {
            if (b.backgroundColor!.name! != Color.black) {
                colors = colors + " \(b.backgroundColor!.name!)"
                line.changeColor(index: i, color: b.backgroundColor!.name!)
                i += 1
                correctLine = true
            } else {
                let alert = UIAlertController(title: "A color is missing", message: "A color is missing in your selection. The black color is not a color taken into account in the selection of colors.", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                correctLine = false
                break
            }
        }
        if correctLine {
            setLine(colors: line, line: lineNumber)
            var verif = game.verif(line: line)
            lineNumber += 1
            if(verif[0] == 4){
                endGame(win: true)
            } else if (lineNumber == 11){
                endGame(win: false)
            }
        }
    }
    
    func setLine(colors: Line, line: Int){
        var lineModif : [UIButton]! {
            switch line {
            case 0:
                return self.blocks1
            case 1:
                return self.blocks2
            case 2:
                return self.blocks3
            case 3:
                return self.blocks4
            case 4:
                return self.blocks5
            case 5:
                return self.blocks6
            case 6:
                return self.blocks7
            case 7:
                return self.blocks8
            case 8:
                return self.blocks9
            case 9:
                return self.blocks10
            case 10:
                return self.blocks11
            case 11:
                return self.blocks12
            default:
                return nil
            }
        }
        for i in 0...3 {
            lineModif[i].backgroundColor = colors.colors[i].color!
        }
    }
    
    func winMessage(score: Int){
        let win = UIAlertController(title: "Win !", message: "You have won. Your score is \(score)", preferredStyle: UIAlertController.Style.alert)
        win.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(win, animated: true, completion: nil)
    }
    
    func loseMessage() {
        let lose = UIAlertController(title: "Game Over !", message: "You used your every move.", preferredStyle: UIAlertController.Style.alert)
        lose.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(lose, animated: true, completion: nil)
    }
    
    
    func reset() {
        for b in allBlocks {
            b.backgroundColor = UIColor.white
        }
        
        for b in blockd {
            b.backgroundColor = UIColor.black
        }
        lineNumber = 0
        game = Mastermind()
    }
    
    func endGame(win: Bool) {
        if(win){
            winMessage(score: game.getScore())
        } else {
            loseMessage()
        }
        reset()
    }
}

extension UIColor {
    var name: Color? {
        switch self {
            case UIColor.black: return Color.black
            case UIColor.red: return Color.red
            case UIColor.green: return Color.green
            case UIColor.blue: return Color.blue
            case UIColor.yellow: return Color.yellow
            case UIColor.magenta: return Color.magenta
            case UIColor.orange: return Color.orange
            default: return nil
        }
    }
}

extension Color {
    var color: UIColor? {
        switch self {
            case Color.black: return UIColor.black
            case Color.red: return UIColor.red
            case Color.green: return UIColor.green
            case Color.blue: return UIColor.blue
            case Color.yellow: return UIColor.yellow
            case Color.magenta: return UIColor.magenta
            case Color.orange: return UIColor.orange
            default: return UIColor.black
        }
    }
}

