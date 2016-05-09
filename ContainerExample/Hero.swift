//
//  Hero.swift
//  ContainerExample
//
//  Created by Ben Gohlke on 5/9/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation

class Hero
{
    var name: String
    var powers: String
    
    init(heroDictionary: NSDictionary)
    {
        name = heroDictionary["name"]! as! String
        powers = heroDictionary["powers"]! as! String
    }
}