//
//  ViewController.swift
//  MasterMind
//
//  Created by Romain BEAUSSART on 28/03/2019.
//  Copyright © 2019 Romain BEAUSSART. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet var blockd: [UIButton]!
    

    @IBAction func blockTouched(_ sender: UIButton) {
        let blockText = sender.titleLabel!.text!
        print("\(blockText) block was touched")
        
        changeColor (ofBlock: sender)
        printAllBlockColors ()
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
            thisBlock.backgroundColor = UIColor.black
        default:
            thisBlock.backgroundColor = UIColor.black
        }
    }
    
    func printAllBlockColors () {
        var colors = ""
        for b in blockd {
            colors = colors + " \(b.backgroundColor!.name!)"
        }
        print("Colors: \(colors) \n")
    }
}

extension UIColor {
    var name: String? {
        switch self {
        case UIColor.black: return "black"
        case UIColor.darkGray: return "darkGray"
        case UIColor.lightGray: return "lightGray"
        case UIColor.white: return "white"
        case UIColor.gray: return "gray"
        case UIColor.red: return "red"
        case UIColor.green: return "green"
        case UIColor.blue: return "blue"
        case UIColor.cyan: return "cyan"
        case UIColor.yellow: return "yellow"
        case UIColor.magenta: return "magenta"
        case UIColor.orange: return "orange"
        case UIColor.purple: return "purple"
        case UIColor.brown: return "brown"
        default: return nil
        }
    }
}

