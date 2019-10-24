//
//  TappingViewController.swift
//  Game Framework
//
//  Created by Chelsea Lin on 2019/7/25.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit

class TappingViewController: UIViewController, GameSystem {    


    @IBOutlet weak var pieImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    
    var score = 0
    var played = UserDefault.getPlayTime() // 取得遊戲次數紀錄
    var timer: Timer?
    var totalTime = 5

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wooden")!)
        setGame()
        setTime()
    }
    
    @objc func tapTime() {
        
        score = score + 1
        
        if score >= 5 {
            pieImage.image = UIImage(named: "pie0")
        }; if score >= 10 {
            pieImage.image = UIImage(named: "pie2")
        }; if score >= 15 {
            pieImage.image = UIImage(named: "pie3")
        }; if score >= 20 {
            pieImage.image = UIImage(named: "pie4")
        }; if score >= 25 {
            pieImage.image = UIImage(named: "pie5")
        }; if score >= 30 {
            pieImage.image = UIImage(named: "pie6")
        }; if score >= 40 {
            pieImage.image = UIImage(named: "pie7")
        }
        
        let currentScore = UserDefault.getScore()
        if score > currentScore {
            UserDefault.saveScore(score)
        }
    }
    
    // 設定每一局遊戲
    func setGame() {
        score = 0
        pieImage.image = UIImage(named: "pie")
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(tapTime))
        pieImage.isUserInteractionEnabled = true
        pieImage.addGestureRecognizer(singleTap)
    }
    
    
    // 遊戲倒數
    func setTime(){
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime(){
        
        timeLabel.text = "剩餘時間: \(totalTime) 秒"
        if totalTime != 0 {
            totalTime -= 1
            
        } else {
            endTime()
            //時間到 遊玩次數+1
            played += 1
            UserDefault.savePlayTime(played)
            // show alert
            let alert = UIAlertController(title: "時間到", message: "成功次數：\(score)", preferredStyle: UIAlertController.Style.alert)
            let backAction = UIAlertAction(title: "Play Later", style: .default) { (action) in
                self.navigationController?.popViewController(animated: true)
                
            }
            
            let okAction = UIAlertAction(title: "Try Again", style: .default) { (action) in
                
                // 重置遊戲
                self.setGame()
                // 重置時間
                self.totalTime = 5
                self.setTime()
                
                
            }
            
            alert.addAction(okAction)
            alert.addAction(backAction)
           
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    func endTime() {
        timer?.invalidate()
        }
    
}

