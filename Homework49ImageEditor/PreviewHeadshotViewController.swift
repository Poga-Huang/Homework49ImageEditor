//
//  PreviewHeadshotViewController.swift
//  Homework49ImageEditor
//
//  Created by 黃柏嘉 on 2022/1/5.
//

import UIKit

class PreviewHeadshotViewController: UIViewController {

    @IBOutlet weak var previewImage: UIImageView!
    var previousPageImage:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        previewImage.image = previousPageImage
    }
    
    @IBAction func dismissSelf(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func selectImageSource(_ sender: UIButton) {
        print("選擇大頭照來源")
    }
}
