//
//  Pokemon.swift
//  Pokedex
//
//  Created by Jarrod Serrano on 4/18/17.
//  Copyright © 2017 Jarrod Serrano. All rights reserved.
//

import Foundation

struct Pokemon {
    
    let name: String
    let id: Int
    let abilities: [String]
}


//MArk: - JSON


extension Pokemon {
    private static let kName = "name"
    private static let kID = "id"
    private static let kAbilities = "abilities"
    
    init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary[Pokemon.kName] as? String,
            let id = dictionary[Pokemon.kID] as? Int,
            let abilityDictionary = dictionary[Pokemon.kAbilities] as?
                [[String: AnyObject]] else { return nil }

        let abilities = abilityDictionary.flatmap { $0["ability"]?["name"]
            as? String }
            
        
        self.init(name: name, id: id, abilities: abilities)
    }
    
}
