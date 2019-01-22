//
//  Hero.swift
//  ContainerExample
//
//  Created by Ben Gohlke on 1/21/19.
//  Copyright © 2019 Ben Gohlke. All rights reserved.
//

import Foundation

struct Hero : Codable
{
    let name: String
    let powers: String
    
    func imageName() -> String
    {
        return name.replacingOccurrences(of: " ", with: "-").lowercased()
    }
}
