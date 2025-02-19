//
//  PokemonTeamTableViewController.swift
//  Pokedex-v3
//
//  Created by Austin Potts on 9/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PokemonTeamTableViewController: UITableViewController {

    let pokemonController = PokemonController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()

       
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pokemonController.pokemonTeam.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath)

        let pokemon = pokemonController.pokemonTeam[indexPath.row]
        guard let pokemonImageData = try? Data(contentsOf: pokemon.sprites.frontDefault) else {fatalError()}
        cell.imageView?.image = UIImage(data: pokemonImageData)
        cell.textLabel?.text = pokemon.name.capitalized

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SearchPokemonSegue" {
            guard let searchVC = segue.destination as? PokemonSearchViewController else {return}
            searchVC.pokemonController = pokemonController
        } else if segue.identifier == "ShowPokemonSegue"{
            guard let detailVC = segue.destination as? PokemonDetailViewController else {return}
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            let pokemon = pokemonController.pokemonTeam[indexPath.row]
            detailVC.pokemon = pokemon
        
        }
        
    }
    

}
