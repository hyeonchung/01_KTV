//
//  HomeRecentWatchItemCellCollectionViewCell.swift
//  KTV
//
//  Created by 정현준 on 6/14/24.
//

import UIKit

class HomeRankingItemCell: UICollectionViewCell {

    static let identifier: String = "HomeRankingItemCell"
    static let width: CGFloat = 130
    static let height: CGFloat = 230

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var numberView: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.layer.cornerRadius = 10
    }
}
