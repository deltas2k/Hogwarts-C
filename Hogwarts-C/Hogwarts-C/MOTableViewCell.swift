//
//  MOTableViewCell.swift
//  Hogwarts-C
//
//  Created by Matthew O'Connor on 10/8/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

import UIKit

class MOTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var houseImageView: UIImageView!
    @IBOutlet weak var deathEaterImageView: UIImageView!
    @IBOutlet weak var bloodStatusImageView: UIImageView!
    
    func updateViews(with character: MOCharacter) {
        nameLabel.text = character.name
        roleLabel.text = character.role
        
        if character.deathEater == true {
            deathEaterImageView.isHidden = false
        }
        if character.bloodStatus != "unknown" {
            bloodStatusImageView.isHidden = false
            bloodStatusImageView.image = UIImage.init(named: character.bloodStatus)
        }
        
        if let house = character.house {
            houseImageView.isHidden = false
            houseImageView.image = UIImage.init(named: house.lowercased())
        }
        //half-blood, pure-blood
    }

}
