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
    
    @IBOutlet var blockd: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for b in blockd {
            b.layer.cornerRadius = 25
        }
    }
    
    @IBAction func blockTouched(_ sender: UIButton) {

        changeColor (ofBlock: sender)
    }
    
    @IBAction func sendResult(_ sender: UIButton) {
        validBlockColors ()
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
    
    func validBlockColors () {
        var colors = ""
        let line = Line()
        var i = 0
        for b in blockd {
            colors = colors + " \(b.backgroundColor!.name!)"
            line.changeColor(index: i, color: b.backgroundColor!.name!)
            i += 1
        }
        print("Colors: \(colors) \n")
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

