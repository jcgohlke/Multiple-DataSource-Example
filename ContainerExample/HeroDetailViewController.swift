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
    
    @IBOutlet weak var superNameLabel: UILabel!
    @IBOutlet weak var realNameLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var powersLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    var hero: Hero?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        configureView()
    }
    
    func configureView()
    {
        guard let hero = hero else { return }
        
        superNameLabel.text = hero.alias
        realNameLabel.text = hero.name
        powersLabel.text = hero.powers
        summaryLabel.text = hero.summary
        avatarImageView.image = UIImage(named: hero.imageName())
        avatarImageView.layer.cornerRadius = 8
        avatarImageView.clipsToBounds = true
    }
}
