//
//  EditHeadshotViewController.swift
//  Homework49ImageEditor
//
//  Created by 黃柏嘉 on 2022/1/6.
//

import UIKit
import CoreImage.CIFilterBuiltins

class EditHeadshotViewController: UIViewController {

    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var editImageView: UIImageView!
    @IBOutlet weak var previewScrollView: UIScrollView!
    
    var aPartOfimage:UIImage?
    let editor = ImageEditor()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        editor.image = editImageView.image
        
    }
    @IBAction func changeImageFilter(_ sender: UIButton) {
        
        editImageView.image = editor.changeImageFilter(tag: sender.tag)
        
    }
    
    
   
    

}
