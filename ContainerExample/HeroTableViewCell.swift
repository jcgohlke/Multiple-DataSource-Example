//
//  HeroTableViewCell.swift
//  ContainerExample
//
//  Created by Ben Gohlke on 5/9/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class HeroTableViewCell: UITableViewCell
{
    
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var powersLabel: UILabel!

    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}