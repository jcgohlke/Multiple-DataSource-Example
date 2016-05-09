//
//  TeamIronManDataSource.swift
//  ContainerExample
//
//  Created by Ben Gohlke on 5/9/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class TeamIronManDataSource: NSObject, UITableViewDataSource
{
    var heroes: [Hero]
    
    override init()
    {
        heroes = [Hero]()
        super.init()
        loadHeroes()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return heroes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("HeroCell", forIndexPath: indexPath) as! HeroTableViewCell
        
        let aHero = heroes[indexPath.row]
        cell.heroNameLabel.text = aHero.name
        cell.powersLabel.text = aHero.powers
        
        return cell
    }
    
    func loadHeroes()
    {
        do
        {
            let filePath = NSBundle.mainBundle().pathForResource("TeamIronMan", ofType: "json")
            let dataFromFile = NSData(contentsOfFile: filePath!)
            let heroData: NSArray! = try NSJSONSerialization.JSONObjectWithData(dataFromFile!, options:[]) as! NSArray
            for heroDictionary in heroData
            {
                let aHero = Hero(heroDictionary: heroDictionary as! NSDictionary)
                heroes.append(aHero)
            }
            heroes.sortInPlace({ $0.name < $1.name })
        }
        catch
        {
            print(error)
        }
    }
}