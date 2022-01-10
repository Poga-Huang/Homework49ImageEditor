//
//  MainViewController.swift
//  Homework49ImageEditor
//
//  Created by 黃柏嘉 on 2022/1/5.
//

import UIKit
enum EditingImage{
    case backView
    case headshot
}
class MainViewController: UIViewController {
    
    //seugue名稱
    struct segueIdentifier{
        static let toPreview = "previewImage"
    }

    @IBOutlet weak var backViewImage: UIImageView!
    @IBOutlet weak var headshotImage: UIImageView!
    @IBOutlet weak var MessageButton: UIButton!
    //要預覽的照片
    var previewImage:UIImage?
    var editinagImage:EditingImage?
    
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
        editinagImage = .backView
        performSegue(withIdentifier: segueIdentifier.toPreview, sender: nil)
    }
    @IBAction func editHeadshotImage(_ sender: UITapGestureRecognizer) {
        previewImage = headshotImage.image
        editinagImage = .headshot
        performSegue(withIdentifier: segueIdentifier.toPreview, sender: nil)
    }
    
    //傳送照片
    @IBSegueAction func passImage(_ coder: NSCoder) -> PreviewImageViewController? {
        guard let editinagImage = editinagImage,let previewImage = previewImage else{return PreviewImageViewController(coder: coder)
        }
        return PreviewImageViewController(coder: coder, passImage: previewImage,editingImage:editinagImage)
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
            MessageButton.configuration?.title = sourceViewController.editTextField.text
        }
        if let sourceViewController = unwindSegue.source as? EditImageViewController{
            switch editinagImage{
            case .backView:
                backViewImage.image = sourceViewController.editImage
            case .headshot:
                headshotImage.image = sourceViewController.editImage
            default:
                return
            }
        }
    }
    
    //分享畫面
    @IBAction func shareMainView(_ sender: UIButton) {
        let image = screenshot(view: view)
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityController.completionWithItemsHandler = {(activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) in
            if error != nil{
                self.alert(title: "錯誤", message: "分享失敗")
            }
            if completed{
                self.alert(title: "成功", message: "分享成功")
            }
        }
        present(activityController, animated: true, completion: nil)
    }
}
