//
//  ViewController.swift
//  StupidSort
//
//  Created by Lapo on 25/09/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var attemptsTitleLabel: UILabel!
    @IBOutlet weak var attemptsLabel: UILabel!
    
    var arraySorted = [Int](1...10)
    var success = false
    var attempt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attemptsLabel.text = "0"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.global(qos: .userInitiated).async { [self] in
            while(!success){
                attempt += 1
                
                let shuffled = arraySorted.shuffled()
                
                if(shuffled == arraySorted){
                    success = true
                    for (i, number) in shuffled.enumerated() {
                        print("\(i) -> \(number)")
                    }
                }
                
                if(attempt.isMultiple(of: 1000000) || success){
                    print("Attempt: \(attempt)")
                    
                    DispatchQueue.main.async {
                        if(success){
                            attemptsTitleLabel.text = "OH YEAH! You have stupid sorted array from \(arraySorted.first!) to \(arraySorted.last!) in:"
                        }
                        attemptsLabel.text = NumberFormatter.localizedString(from: NSNumber(value: attempt), number: NumberFormatter.Style.decimal) + (success ? " attempts" : "")
                    }
                }
            }
        }
    }
}

