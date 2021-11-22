//
//  PictureDetailsVC.swift
//  MVVMFetchProject
//
//  Created by Ceren Çapar on 22.11.2021.
//

import UIKit

class PictureDetailsVC: UIViewController {
    @IBOutlet weak var resultNameLabel: UILabel!
    @IBOutlet weak var resultImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButtonAdded()
        fixImageViewAndLabelField()
        
    }
    fileprivate func backButtonAdded() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Photos", style: UIBarButtonItem.Style.plain, target: self, action: #selector(goBack))
    }
    @objc func goBack(){
        self.dismiss(animated: true, completion: nil)
    }
    func fixImageViewAndLabelField() {
        resultNameLabel.lineBreakMode = .byWordWrapping
        resultNameLabel.numberOfLines = 0
        resultImageView.layer.cornerRadius = 50
        resultImageView.sd_setImage(with: URL(string: Photos.selectedPhotoUrl))
        resultNameLabel.text = Photos.selectedPhotoname
    }
}
