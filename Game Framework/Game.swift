//
//  Game.swift
//  Game Framework
//
//  Created by Chelsea Lin on 2019/7/25.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import Foundation
import UIKit


protocol GameSystem: UIViewController {
    
    var score : Int  { get set }
    var played: Int  { get set }
    var timer: Timer? { get set }
    //遊戲設定
    func setGame()
    //時間設定
    func setTime()
    
}

struct GameCreater {
    
    var name : String
    var score: Int
    var playedTime: Int

}



//創建遊戲
class GameData {
    
    static func getGame(completion: @escaping () -> Void) -> [GameCreater] {
        
        var games : [GameCreater] = []
        
        //取得遊戲紀錄&最高分資料
        let score = UserDefault.getScore()
        let playtime = UserDefault.getPlayTime()
        let score1 = UserDefault.getGuessGameScore()
        let playtime1 = UserDefault.getGuessGamePlayTime()
        let score2 = UserDefault.getHitScore()
        let playtime2 = UserDefault.getHitPlayTime()
        
        
        //新增遊戲
        let game1 = GameCreater(name: "PIE Eater 🍕", score: score, playedTime: playtime)
        let game2 = GameCreater(name: "Guess Number🤔", score: score1, playedTime: playtime1)
        let game3 = GameCreater(name: "Hit Monster👾", score: score2, playedTime: playtime2)
        
        print(games)
        
        
        games.append(game1)
        games.append(game2)
        games.append(game3)
        
        completion()
        return games
    
    }
}



