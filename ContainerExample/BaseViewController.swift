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
    
    var secondWindow: UIWindow?
    var secondScreen: UIScreen?
    
    let teamCap = CivilWarDataSource(for: "TeamCap")
    let teamIronMan = CivilWarDataSource(for: "TeamIronMan")
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        heroesTableView.dataSource = teamCap
        title = "Civil War"
        
        NotificationCenter.default.addObserver(self, selector: #selector(externalScreenDisconnected), name: UIScreen.didDisconnectNotification, object: nil)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        if let ds = heroesTableView.dataSource as? CivilWarDataSource,
            let destinationVC = storyboard?.instantiateViewController(withIdentifier: "HeroDetailView") as? HeroDetailViewController
        {
            destinationVC.hero = ds.hero(at: indexPath.row)
            checkForSecondScreenAndReturnWindowIfPresent()
            if let secondWindow = secondWindow
            {
                secondWindow.rootViewController = destinationVC
                secondWindow.isHidden = false
            } else
            {
                navigationController?.pushViewController(destinationVC, animated: true)
            }
        }
    }
    
    func checkForSecondScreenAndReturnWindowIfPresent()
    {
        if secondScreen == nil, UIScreen.screens.count > 1
        {
            let secScreen = UIScreen.screens[1]
            secScreen.currentMode = secScreen.preferredMode
            secondScreen = secScreen
        }
        
        guard let secondScreen = secondScreen else { return }
        
        if secondWindow == nil
        {
            let bounds = secondScreen.bounds
            let secWindow = UIWindow(frame: bounds)
            secWindow.screen = secondScreen
            secondWindow = secWindow
        }
    }
    
    @objc func externalScreenDisconnected(notification: Notification)
    {
        self.secondWindow?.isHidden = true
        self.secondWindow = nil
        self.secondScreen = nil
    }
}
