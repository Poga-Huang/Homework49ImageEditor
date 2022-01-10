//
//  EditHeadshotViewController.swift
//  Homework49ImageEditor
//
//  Created by 黃柏嘉 on 2022/1/6.
//

import UIKit
import CoreImage.CIFilterBuiltins

class EditImageViewController: UIViewController{
    
    @IBOutlet weak var drawView: UIView!
    @IBOutlet weak var mirrorView: UIView!
    @IBOutlet weak var rotateView: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var editImageView: UIImageView!
    @IBOutlet weak var previewScrollView: UIScrollView!
    @IBOutlet var filterButtons: [UIButton]!
    
    //接收照片
    var editImage:UIImage
    init?(coder:NSCoder,passImage:UIImage){
        self.editImage = passImage
        super.init(coder: coder)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //圖片編輯類別
    let editor = ImageEditor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editImageView.image = editImage
        editor.image = editImage
        //button圖片濾鏡
        for (i,button) in filterButtons.enumerated(){
            button.configuration?.background.image = editor.changeImageFilter(tag: i)
        }
        previewScrollView.contentSize = editImageView.frame.size
        previewScrollView.delegate = self
    }
    //關掉畫面
    @IBAction func dismissSelf(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    //更換濾鏡
    @IBAction func changeImageFilter(_ sender: UIButton) {
        editImageView.image = editor.changeImageFilter(tag: sender.tag)
    }
    //轉向
    @IBAction func turnRight(_ sender: UIButton) {
        editor.rotateImage(view: rotateView)
    }
    //鏡像
    @IBAction func mirrorImage(_ sender: UIButton) {
        editor.mirrorImage(view: mirrorView)
    }
    //選擇比例
    @IBAction func scaleSegmentedControl(_ sender: UISegmentedControl) {
        editor.changeScale(index: sender.selectedSegmentIndex, view: previewScrollView)
    }
    //完成編輯
    @IBAction func complete(_ sender: UIButton) {
        editImage = screenshot(view: drawView)
    }
    
    

}
