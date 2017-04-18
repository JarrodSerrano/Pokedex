//
//  PokedexViewController.swift
//  Pokedex
//
//  Created by Jarrod Serrano on 4/18/17.
//  Copyright © 2017 Jarrod Serrano. All rights reserved.
//

import UIKit

class PokedexViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var idLabel: UILabel!

    @IBOutlet weak var abilitiesLabel: UILabel!
    
  
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
        PokemonController.fetchPokemon(for: searchTerm) { (pokemon) in
            DispatchQueue.main.async {
            guard let pokemon = pokemon else { return }
            self.nameLabel.text = pokemon.name.capitalized
            self.idLabel.text = "ID: \(pokemon.id)"
            self.abilitiesLabel.text = "Abilities: \(pokemon.abilities.joined(separator: ","))"
        
        
    }

        }
    }
    

}
