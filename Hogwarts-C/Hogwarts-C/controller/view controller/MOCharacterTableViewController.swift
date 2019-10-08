//
//  MOCharacterTableViewController.swift
//  Hogwarts-C
//
//  Created by Matthew O'Connor on 10/8/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

import UIKit

class MOCharacterTableViewController: UITableViewController {

    var characters: [MOCharacter] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        MOCharacterController.fetchCharacters { (characters) in
            DispatchQueue.main.async {
                self.characters = characters
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return characters.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as? MOTableViewCell else {return UITableViewCell()}
        let character = characters[indexPath.row]

        cell.updateViews(with: character)

        return cell
    }
    


}
