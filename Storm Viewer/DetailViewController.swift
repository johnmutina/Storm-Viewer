//
//  DetailViewController.swift
//  Storm Viewer
//
//  Created by Fabio on 03/03/2019.
//  Copyright © 2019 JohnMutina. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedImage : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // don't display large titles in this particular view
        navigationItem.largeTitleDisplayMode = .never
        
        // set the title equal to the name of the image you selected
        title = selectedImage
        // if the selectedImage value exists
        if let imageToLoad = selectedImage {
            // set the UIImage equal to the image that has been selected by the user
            imageView.image = UIImage(named: imageToLoad)
        }
        
    }
    
    // when this view is open
    override func viewWillAppear(_ animated: Bool) {
        // do whatever your parent class told you to
        super.viewWillAppear(animated)
        // activate the option to hide the navigationController on tap
        navigationController?.hidesBarsOnTap = true
    }
    
    // when I exit the view
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // deactivate the option to avoid conflicts in other views
        navigationController?.hidesBarsOnTap = false
    }
    
    // for iPhone X, we can handle the HomeButton preference
    override var prefersHomeIndicatorAutoHidden: Bool {
        // when the navigation controller bar is hidden, hide the home button too.
        return navigationController?.hidesBarsOnTap ?? false
    }
}
