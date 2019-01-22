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
    let alias: String
    let name: String
    let powers: String
    let summary: String
    
    func imageName() -> String
    {
        return alias.replacingOccurrences(of: " ", with: "-").lowercased()
    }
}
