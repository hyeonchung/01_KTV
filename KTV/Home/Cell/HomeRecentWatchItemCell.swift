//
//  HomeRecentWatchItemCell.swift
//  KTV
//
//  Created by 정현준 on 6/19/24.
//

import UIKit

class HomeRecentWatchItemCell: UICollectionViewCell {

    static let identifier: String = "HomeRecentWatchItemCell"
    static let width: CGFloat = 84
    static let height: CGFloat = 148

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.thumbnailImage.layer.cornerRadius = self.thumbnailImage.bounds.height / 2
    }
}
