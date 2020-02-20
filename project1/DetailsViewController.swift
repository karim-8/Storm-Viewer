//
//  DetailsViewController.swift
//  project1
//
//  Created by KARIM on 2/20/20.
//  Copyright © 2020 KARIM. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedImage:String?
    var imagePostion: Int = 0
    var imagesCount: Int = 0

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        var imageCombinedName: String {
            if (imagePostion != 0) && (imagesCount != 0) {
                return "Number \(imagePostion) of \(imagesCount)"
            }else {
                return "No data"
            }
        }
        title = imageCombinedName
        navigationItem.largeTitleDisplayMode = .never
        
        //optional chaining if we received nill from other vc
        if let image = selectedImage {
            imageView.image = UIImage(named: image)
        }

    }
}

extension DetailsViewController {
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
