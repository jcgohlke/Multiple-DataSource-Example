//
//  ViewController.swift
//  ContainerExample
//
//  Created by Ben Gohlke on 5/9/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, UITableViewDelegate
{

    @IBOutlet weak var heroesTableView: UITableView!
    
    let teamCapDS = TeamCapDataSource()
    let teamIMDS = TeamIronManDataSource()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        heroesTableView.dataSource = teamCapDS
        title = "Civil War"
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentedControlValueChanged(sender: UISegmentedControl)
    {
        if sender.selectedSegmentIndex == 0
        {
            heroesTableView.dataSource = teamCapDS
        }
        else
        {
            heroesTableView.dataSource = teamIMDS
        }
        heroesTableView.reloadData()
    }
}