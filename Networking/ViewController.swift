//
//  ViewController.swift
//  Networking
//
//  Created by Heli Sivunen on 27/08/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var ViewToOutletConnection: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let sharedSession = URLSession.shared
        
        if let url = URL(string: "https://goo.gl/wV9G4I") {
            let request = URLRequest(url: url)
            let dataTask = sharedSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.imageView.image = image
                    }
                }
            })
            dataTask.resume()
        }
    }


}

