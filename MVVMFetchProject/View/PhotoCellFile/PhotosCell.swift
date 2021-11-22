//
//  PhotosCell.swift
//  MVVMFetchProject
//
//  Created by Ceren Çapar on 22.11.2021.
//

import UIKit

class PhotosCell: UICollectionViewCell {
    @IBOutlet weak var photoNameLabelField: UILabel!
    @IBOutlet weak var photosImageView: UIImageView!
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let targetSize = CGSize(width: layoutAttributes.frame.width, height: 0)
        layoutAttributes.frame.size = contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
        return layoutAttributes
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        autoSizeLabelField()
    }

}
extension PhotosCell{
    fileprivate func autoSizeLabelField() {
        photoNameLabelField.lineBreakMode = .byWordWrapping
        photoNameLabelField.numberOfLines = 0
    }
}
