//
//  PokemonController.swift
//  Pokedex
//
//  Created by Jarrod Serrano on 4/18/17.
//  Copyright © 2017 Jarrod Serrano. All rights reserved.
//

import Foundation

class PokemonController {
    
    static let baseURL = URL(string: "http://pokeapi.co/api/v2/pokemon/")
    
    //READ / Fetch
    
  // Notes: ? & = url parameters
        //   / represents path components
        // . is the path extension
  
    
    static func fetchPokemon(for searchTerm: String, completion: @escaping (Pokemon?) -> Void) {
      //appendingPathComponent because the api uses /pokemon/ as the searchItem
        guard let url = baseURL?.appendingPathComponent(searchTerm) else { completion(nil); return }
        
        NetworkController.performRequest(for: url, httpMethod: .get) {data, error in //body of closure
            //parameters
            //body of closure
            // check to make sure data is not nil
            guard let data = data,
            //convert our data into JSON, this holds our entire response. our response if of [String: Any].
                let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any] else { completion(nil); return }
            
            // since our response if of type [string: Any] we do not have to flatmap over an array. We can pass in jsonDictionary to uor failable initializer becayse our in itializer will unwrap the KEYS of "name", "id", and "abilities" which are stored in our jsonDictionary response.
            let pokemon = Pokemon(dictionary: jsonDictionary)
            //semd the pokemon object to our completion so we can define the parameter when we create our clouseure when calling fetchPokemon
            completion(pokemon)

        
        
        
    
        }
    
    }
}
