//
//  HeroDetailViewController.swift
//  MultipleDataSourceExample
//
//  Created by Joben Gohlke on 1/21/19.
//  Copyright © 2019 Ben Gohlke. All rights reserved.
//

import UIKit

class HeroDetailViewController: UIViewController
{
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var homeworldLabel: UILabel!
    @IBOutlet weak var powersLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    var hero: Hero?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameLabel.text = hero!.name
//        homeworldLabel.text = "from \(hero!.homeworld)"
        powersLabel.text = hero!.powers
        avatarImageView.image = UIImage(named: hero!.imageName())
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
