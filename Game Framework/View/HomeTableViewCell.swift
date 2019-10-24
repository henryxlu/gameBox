//
//  HomeTableViewCell.swift
//  Game Framework
//
//  Created by Chelsea Lin on 2019/7/25.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var successTimeLabel: UILabel!
    @IBOutlet weak var playedTimeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(_ gameName: GameCreater) {
        
        gameNameLabel.text = gameName.name
        successTimeLabel.text = "Score: \(gameName.score) "
        playedTimeLabel.text = "Played: \(gameName.playedTime)"

    }

}
