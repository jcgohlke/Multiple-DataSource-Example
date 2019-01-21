//
//  ViewController.swift
//  ContainerExample
//
//  Created by Ben Gohlke on 1/21/19.
//  Copyright © 2019 Ben Gohlke. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, UITableViewDelegate
{

    @IBOutlet weak var heroesTableView: UITableView!
    
    let teamCap = CivilWarDataSource(for: "TeamCap")
    let teamIronMan = CivilWarDataSource(for: "TeamIronMan")
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        heroesTableView.dataSource = teamCap
        title = "Civil War"
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl)
    {
        if sender.selectedSegmentIndex == 0
        {
            heroesTableView.dataSource = teamCap
        }
        else
        {
            heroesTableView.dataSource = teamIronMan
        }
        heroesTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
