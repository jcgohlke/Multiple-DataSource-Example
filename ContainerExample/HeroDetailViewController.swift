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
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        determineInteractivity()
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
    }
    
    func determineInteractivity()
    {
        var interactive = true
        if UIScreen.screens.count > 1
        {
            interactive = false
        }
        
        if interactive
        {
            let toolBar = UIToolbar()
            view.addSubview(toolBar)
            
            let guide = view.safeAreaLayoutGuide
            toolBar.translatesAutoresizingMaskIntoConstraints = false
            toolBar.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
            toolBar.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
            toolBar.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
            toolBar.heightAnchor.constraint(equalToConstant: 44).isActive = true
            
            let addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissView))
            toolBar.setItems([addBarButtonItem], animated: false)
            
        }
    }
    
    @objc func dismissView()
    {
        dismiss(animated: true, completion: nil)
    }
}
