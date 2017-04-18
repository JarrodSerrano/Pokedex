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
    let abilities: String
}


//MArk: - JSON


extension Pokemon {
    private static let kName = "name"
    private static let kID = "id"
    private static let kAbilities = "abilities"
    
    init?(dictionary: [String: Any]) {
        guard let name = dictionary[Pokemon.kName] as? String,
            let id = dictionary[Pokemon.kID] as? Int,
           
        // getting the abilityDictionary from "abilities" because "abilities" returns an array of dictionary from the api and has to be parsed into an abilities array of string.
            let abilityDictionary = dictionary[Pokemon.kAbilities] as?
                [[String: AnyObject]] else { return nil }
// using anyObject so that we can subscript the dictionary, and chain keys to get the value of the final key of "name" then cast that as a string.
        let abilities = abilityDictionary.flatMap { $0["ability"]?["name"]
            as? String }
            
        
        self.init(name: name, id: id, abilities: abilities)
    }
    
}
