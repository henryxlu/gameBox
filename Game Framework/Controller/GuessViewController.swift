//
//  GuessViewController.swift
//  Game Framework
//
//  Created by Henry on 2019/7/31.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit

class GuessViewController: UIViewController, GameSystem, UITextFieldDelegate {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var chanceLabel: UILabel!
    @IBOutlet weak var textfield: UITextField!
    
    
    
    var answer = 0
    var chance = 5
    var maxNumber = 100
    var minNumber = 0
    

    var score: Int = 0
    var played: Int = UserDefault.getGuessGamePlayTime()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGame()
        textfield.becomeFirstResponder()
        textfield.delegate = self
        textfield.keyboardType = .numberPad
        
    }
    
    
    
    
    //limit number only
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return string == string.filter("0123456789".contains)
    }
    //character.isnumber
    
    
    func setGame() {
        score = 0
        chance = 5
        maxNumber = 100
        minNumber = 0
        answer = Int.random(in: 0...100)
        tipLabel.text = "0~100"
        chanceLabel.text = "您還有\(chance)次"
        textfield.placeholder = "0~100"
        
        played += 1
        UserDefault.saveGuessGamePlayTime(played)
    }
    
    fileprivate func extractedFunc() {
        if chance == 4 {
            score += 5
        } else if chance == 3 {
            score += 4
        } else if chance == 2{
            score += 3
        } else if chance == 1{
            score += 2
        } else if chance == 0 {
            score += 1
        }
        
        let currentScore = UserDefault.getGuessGameScore()
        if score > currentScore {
            UserDefault.saveGuessGameScore(score)
        }
    }
    
    @IBAction func inputButton(_ sender: Any) {
        
        print("\(answer)")
        chance -= 1
        chanceLabel.text = "您還有\(chance)次"
        
        var message : String
        var title: String
        
        guard let input = Int(textfield.text!) else { return }
        if input > 100 {
            tipLabel.text = "wrong range"
            return
        }
        textfield.text = ""
        switch chance > 0 {
        case true:
            switch true {
            case input > answer :
                tipLabel.text = "Too large, between \(input)~\(minNumber)"
                maxNumber = input
                return
            case input < answer :
                tipLabel.text = "Too small, between \(maxNumber)~\(input)"
                minNumber = input
                return
            case input == answer :
                extractedFunc()
                tipLabel.text = "correct"
                title = "恭喜"
                message = "正確數字是\(answer)，得到\(score)分"
            case true:
                fatalError()
            default :
                print(#line, "in defaut")
                return
            }
            
        case false:
            title = "次數用光"
            message = "正確數字是\(answer)，得到\(score)分"
        }
        
        
        
        let alert = UIAlertController(title: title , message: message, preferredStyle: UIAlertController.Style.alert)
        let backAction = UIAlertAction(title: "Play Later", style: .default) { (UIAlertAction) in
            self.navigationController?.popViewController(animated: true)
        }
        let okAction = UIAlertAction(title: "Try Again", style: .default) { (UIAlertAction) in
            self.setGame()
        }
        
        alert.addAction(okAction)
        alert.addAction(backAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    func setTime() {
        print("a")
    }
    
    
    
}
