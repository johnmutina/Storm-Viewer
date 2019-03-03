//
//  ViewController.swift
//  Storm Viewer
//
//  Created by Fabio on 02/03/2019.
//  Copyright © 2019 JohnMutina. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    // empty array that will hold our pics
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set large titles true to follow iOS 11 styling guidelines
        navigationController?.navigationBar.prefersLargeTitles = true
        // title for the navigation controller
        title = "Storm Viewer"
        
        
        // store fileManager in a variable
        let fm = FileManager.default
        // se the path where we store out pictures
        let path = Bundle.main.resourcePath!
        // store the pictures in a variable
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        // loop through the pics and
        for item in items {
            // if their name starts with "nssl"
            if item.hasPrefix("nssl"){
                // append them to the empty pictures array
                pictures.append(item)
            }
        }
    }
    
    // creates a certain number of rows that could contain cells
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // set the number equal to the count of pictures array
        return pictures.count
    }
    
    // create a cell for each row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // use the cell with the identifier "Picture"
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        // set its text equal to each picture name in the array
        cell.textLabel?.text = pictures[indexPath.row]
        // return the cell
        return cell
    }
    
    // function to determine what happens when I tap on a row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // if a ViewController with ID of "Detail" exist and it has type "DetailViewController"
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // set its selectedImage variable equal to the picture corresponding
            vc.selectedImage = pictures[indexPath.row]
            // push the viewController onto the screen using the navigationController
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

