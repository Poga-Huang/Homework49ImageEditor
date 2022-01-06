//
//  MainViewController.swift
//  Homework49ImageEditor
//
//  Created by 黃柏嘉 on 2022/1/5.
//

import UIKit

class MainViewController: UIViewController {
    
    //seugue名稱
    struct segueIdentifier{
        static let toBackViewPreview = "previewBackViewImage"
        static let toHeadshotPreview = "previewHeadshotImage"
    }
    
    @IBOutlet weak var backViewImage: UIImageView!
    @IBOutlet weak var headshotImage: UIImageView!
    @IBOutlet weak var MessageButton: UIButton!
    //要預覽的照片
    var previewImage:UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化大頭照
        if headshotImage.image == nil{
            headshotImage.image = UIImage(systemName: "person.circle")
        }
        
        
    }
    //點選要編輯的照片
    @IBAction func editBackViewImage(_ sender: UITapGestureRecognizer) {
        previewImage = backViewImage.image
        performSegue(withIdentifier: segueIdentifier.toBackViewPreview, sender: nil)
    }
    @IBAction func editHeadshotImage(_ sender: UITapGestureRecognizer) {
        previewImage = headshotImage.image
        performSegue(withIdentifier: segueIdentifier.toHeadshotPreview, sender: nil)
    }
    //傳遞照片到下一頁
    @IBSegueAction func passBackViewImage(_ coder: NSCoder) -> PreviewBackViewController? {
        let controller = PreviewBackViewController(coder: coder)
        controller?.previousPageImage = backViewImage.image
        return controller
    }
   
    @IBSegueAction func passHeadshotImage(_ coder: NSCoder) -> PreviewHeadshotViewController? {
        let controller = PreviewHeadshotViewController(coder: coder)
        controller?.previousPageImage = headshotImage.image
        return controller
    }
    
    //傳遞個簽到下一頁
    @IBSegueAction func passCommentsContent(_ coder: NSCoder) -> PreviewMessageViewController? {
        guard let image = backViewImage.image ,let message = MessageButton.configuration?.title else
        {return PreviewMessageViewController(coder: coder)}
        let controller = PreviewMessageViewController(coder: coder, backgroundImage: image, message: message )
        return controller
    }
    
    //接受回傳值
    @IBAction func unwindToMainViewController(_ unwindSegue: UIStoryboardSegue) {
        if let sourceViewController = unwindSegue.source as? EditMessageViewController{
            MessageButton.configuration?.title = sourceViewController.returnToMainComments
        }
    }
    

}
