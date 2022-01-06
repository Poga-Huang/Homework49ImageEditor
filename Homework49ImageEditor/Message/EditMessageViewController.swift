//
//  EditCommentsViewController.swift
//  Homework49ImageEditor
//
//  Created by 黃柏嘉 on 2022/1/5.
//

import UIKit

class EditMessageViewController: UIViewController {
    
    @IBOutlet weak var editTextField: UITextField!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var labelCountLabel: UILabel!
    //接受上一頁資料
    let backgroundImage:UIImage
    let message:String
    init?(coder:NSCoder,backgroundImage:UIImage,message:String){
        self.backgroundImage = backgroundImage
        self.message = message
        super.init(coder: coder)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //回傳資料
    var returnToMainComments:String?{
        get{
            return editTextField.text
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //初始化畫面
        editTextField.becomeFirstResponder()
        backgroundImageView.image = backgroundImage
        editTextField.text = message
        updateTextCount()
    }
    
    //關閉畫面
    @IBAction func dismissSelf(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    //TextField Actoin
    @IBAction func updateCommentsTextCount(_ sender: UITextField) {
        updateTextCount()
    }
    //更新顯示字數
    func updateTextCount(){
        if let textCount = editTextField.text?.count{
            labelCountLabel.text = "\(textCount)/500"
        }
    }
}
