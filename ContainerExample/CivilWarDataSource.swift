//  File.swift
//  MultipleDataSourceExample
//
//  Created by Ben Gohlke on 1/21/19.
//  Copyright © 2019 The Iron Yard. All rights reserved.
//

import Foundation
import UIKit

final class CivilWarDataSource : NSObject, UITableViewDataSource
{
    var heroes: [Hero]
    
    override init()
    {
        heroes = [Hero]()
        super.init()
    }
    
    convenience init?(for teamName: String?)
    {
        self.init()
        guard let team = teamName else { return }
        loadHeroes(from: team)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeroCell", for: indexPath as IndexPath) as! HeroTableViewCell
        
        let aHero = heroes[indexPath.row]
        cell.heroNameLabel.text = aHero.alias
        cell.powersLabel.text = aHero.powers
        
        return cell
    }
    
    func loadHeroes(from team: String)
    {
        let filePath = URL(fileURLWithPath: Bundle.main.path(forResource: team, ofType: "json")!)
        if let dataFromFile = try? Data(contentsOf: filePath)
        {
            if let heroList = try? JSONDecoder().decode([Hero].self, from: dataFromFile)
            {
                heroes = heroList
                heroes.sort(by: { $0.alias < $1.alias })
            }
        }
    }
    
    func hero(at index: Int) -> Hero
    {
        return heroes[index]
    }
}
