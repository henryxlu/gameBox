//
//  User.swift
//  Game Framework
//
//  Created by Chelsea Lin on 2019/7/25.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import Foundation

// 用Userdefault存取遊戲紀錄&最高分
class UserDefault {
    
    static let countKey = "countKey"
    static let countKey1 = "countKey1"
    static let countKey2 = "countKey2"
    static let playTimeKey = "playTimeKey"
    static let playTimeKey1 = "playTimeKey1"
    static let playTimeKey2 = "playTimeKey2"
    
    
    // 取得最高分資料
    static func getScore() -> Int {
        if let count = UserDefaults.standard.value(forKey: countKey) as? Int {
            return count
        }
        return 0
    }
    static func getGuessGameScore() -> Int {
        if let count = UserDefaults.standard.value(forKey: countKey1) as? Int {
            return count
        }
        return 0
    }
    
    static func getHitScore() -> Int {
        if let count = UserDefaults.standard.value(forKey: countKey2) as? Int {
            return count
        }
        return 0
    }
    
    // 儲存最高分資料
    static func saveScore(_ count: Int) {
        
        UserDefaults.standard.set(count, forKey: countKey)
    }
    
    static func saveGuessGameScore(_ count: Int) {
        
        UserDefaults.standard.set(count, forKey: countKey1)
    }
    static func saveHitScore(_ count: Int) {
        
        UserDefaults.standard.set(count, forKey: countKey2)
    }
    
    // 取得遊玩次數
    static func getPlayTime() -> Int {
        
        if  let playTime = UserDefaults.standard.value(forKey: playTimeKey) as? Int {
            return playTime
        }
        return 0
    }
    
    static func getGuessGamePlayTime() -> Int {
        
        if  let playTime = UserDefaults.standard.value(forKey: playTimeKey1) as? Int {
            return playTime
        }
        return 0
    }
    
    static func getHitPlayTime() -> Int {
        
        if  let playTime = UserDefaults.standard.value(forKey: playTimeKey2) as? Int {
            return playTime
        }
        return 0
    }
    
    
    
    // 儲存遊玩次數
    static func savePlayTime(_ played: Int) {
        UserDefaults.standard.set(played, forKey: playTimeKey)
    }
    
    static func saveGuessGamePlayTime(_ played: Int) {
        UserDefaults.standard.set(played, forKey: playTimeKey1)
    }
    
    static func saveHitPlayTime(_ played: Int) {
        UserDefaults.standard.set(played, forKey: playTimeKey2)
    }


}
