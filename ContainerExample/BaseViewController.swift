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
    @IBOutlet weak var starkLogo: UIImageView!
    
    var secondWindow: UIWindow?
    var secondScreen: UIScreen?
    
    var heroDetailVC: HeroDetailViewController?
    
    let teamCap = CivilWarDataSource(for: "TeamCap")
    let teamIronMan = CivilWarDataSource(for: "TeamIronMan")
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        heroesTableView.dataSource = teamCap
        title = "Roster"
        
        configureView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(externalScreenDisconnected), name: UIScreen.didDisconnectNotification, object: nil)
    }
    
    func configureView()
    {
        navigationController?.navigationBar.barTintColor = UIColor(hue: 359/360, saturation: 40/100, brightness: 10/100, alpha: 1.0)
        navigationController?.navigationBar.tintColor = UIColor(hue: 359/360, saturation: 70/100, brightness: 80/100, alpha: 1.0)
        navigationController?.navigationBar.barStyle = .black
        starkLogo.image = UIImage(named: "stark-logo")?.withRenderingMode(.alwaysTemplate)
        starkLogo.tintColor = UIColor.white
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        heroDetailVC = nil
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
        if let ds = heroesTableView.dataSource as? CivilWarDataSource
        {
            if heroDetailVC == nil {
                heroDetailVC = storyboard?.instantiateViewController(withIdentifier: "HeroDetailView") as? HeroDetailViewController
            }
            
            guard let heroDetailVC = heroDetailVC else { return }
            
            heroDetailVC.hero = ds.hero(at: indexPath.row)
            checkForSecondScreenAndReturnWindowIfPresent()
            if let secondWindow = secondWindow
            {
                if secondWindow.rootViewController != heroDetailVC
                {
                    secondWindow.rootViewController = heroDetailVC
                    secondWindow.isHidden = false
                } else {
                    heroDetailVC.configureView()
                }
            } else
            {
                navigationController?.pushViewController(heroDetailVC, animated: true)
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
        secondWindow?.isHidden = true
        secondWindow = nil
        secondScreen = nil
        heroDetailVC = nil
    }
}
