//
//  HomeRecentWatchContainerCell.swift
//  KTV
//
//  Created by 정현준 on 6/14/24.
//

import UIKit

protocol HomeRankingContainerCellDelegate: AnyObject {
    func homeRankingContainerCell(_ cell: HomeRankingContainerCell, didSelectItemAt index: Int)
}

class HomeRankingContainerCell: UITableViewCell {

    static let identifier: String = "HomeRankingContainerCell"
    static let height: CGFloat = 357

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    weak var delegate: HomeRankingContainerCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()

        setCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func setCollectionView() {

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: HomeRankingItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: HomeRankingItemCell.identifier)
    }
}

extension HomeRankingContainerCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeRankingItemCell.identifier, for: indexPath) as! HomeRankingItemCell

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        self.delegate?.homeRankingContainerCell(self, didSelectItemAt: indexPath.row)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: HomeRankingItemCell.width, height: HomeRankingItemCell.height)
    }
}
