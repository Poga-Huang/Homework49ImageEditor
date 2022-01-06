//
//  PreviewCommentsViewController.swift
//  Homework49ImageEditor
//
//  Created by 黃柏嘉 on 2022/1/5.
//

import UIKit

class PreviewMessageViewController: UIViewController {
    
    
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    //接受上一頁資料
    var message:String
    var backgroundImage:UIImage
    init?(coder:NSCoder,backgroundImage:UIImage,message:String){
        self.backgroundImage = backgroundImage
        self.message = message
        super.init(coder: coder)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        //初始化畫面
        commentsLabel.text = message
        backgroundImageView.image = backgroundImage
        
    }
    //關閉畫面
    @IBAction func dismissSelf(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    //傳遞資料到編輯頁面
    @IBSegueAction func passCommentsToEdit(_ coder: NSCoder) -> EditMessageViewController? {
        let controller = EditMessageViewController(coder: coder, backgroundImage: backgroundImage, message: message)
        return controller
    }
    
    
    
}
