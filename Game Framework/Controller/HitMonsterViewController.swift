//
//  HitMonsterViewController.swift
//  Game Framework
//
//  Created by Henry on 2019/7/31.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit

class HitMonsterViewController: UIViewController, GameSystem {
    
    var score: Int = 0
    var played: Int = 0
    var timer: Timer?
    var buttonTimer :Timer?
    var time = 30
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var monster: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGame()
        setButtonPosition()
        
    }

    
    func setGame() {
        score = 0
        played += 1
        time = 10
        setTime()
        
        played += 1
        UserDefault.saveHitPlayTime(played)
        
    }
    
    func setTime() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeCount), userInfo: nil, repeats: true)
    }
    
    //@objc讓timer slector可以被選到
    @objc func timeCount(){
        
        timeLabel.text = "剩下時間： \(time)秒"
        
        switch true {
        case time != 0:
            time -= 1
        case time == 0:
            //self.timer?.invalidate() 用endTimer func去包
            endTimer()
            endButtonTimer()
            showAlert()
        default: break
        }
        //        if time != 0 {
        //            time -= 1
        //        } else {
        //            //self.timer?.invalidate() 用endTimer去包
        //            endTimer()
        //
        //            let alert = UIAlertController(title: "時間到", message: "成功次數：\(score)", preferredStyle: UIAlertController.Style.alert)
        //            let backAction = UIAlertAction(title: "Play Later", style: .default) { (action) in
        //                self.navigationController?.popViewController(animated: true)
        //            }
        //            let okAction = UIAlertAction(title: "Try Again", style: .default) { (action) in
        //            }
        //        }
        
    }
    @IBAction func hitButton(_ sender: Any) {
        score += 1
        scoreLabel.text = "目前成績\(score)"
        
        let currentScore = UserDefault.getHitScore()
        if score > currentScore {
            UserDefault.saveHitScore(score)
        }
    }
    
    func setButtonPosition() {
        buttonTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(randomButton), userInfo: nil, repeats: true)
//        Timer.scheduledTimer(withTimeInterval: <#T##TimeInterval#>, repeats: <#T##Bool#>) { (<#Timer#>) in
//            <#code#>
//        }
    }
    
    
    @objc func randomButton() {
        monster.center.x = CGFloat.random(in: 44...370)
        monster.center.y = CGFloat.random(in: 55...644)
    
    }
    
    func showAlert() {
        
        let alert = UIAlertController(title: "時間到", message: "成功次數\(score)", preferredStyle: UIAlertController.Style.alert)
        
        let backAction = UIAlertAction(title: "Play Later", style: .default) { (action) in
            self.navigationController?.popViewController(animated: true)
        }
        let okAction = UIAlertAction(title: "Try Again", style: .default) { (action) in
            // 重置遊戲
            self.setGame()
        }
        alert.addAction(okAction)
        alert.addAction(backAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func endTimer() {
        timer?.invalidate()
    }
    
    func endButtonTimer() {
        buttonTimer?.invalidate()
    }
    
    

}
