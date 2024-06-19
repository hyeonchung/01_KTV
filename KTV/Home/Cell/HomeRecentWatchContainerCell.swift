//
//  HomeRecentWatchContainerCell.swift
//  KTV
//
//  Created by 정현준 on 6/19/24.
//

import UIKit
protocol HomeRecentWatchContainerCellDelegate: AnyObject {
    func homeRankingContainerCell(_ cell: HomeRecentWatchContainerCell, didSelectItemAt index: Int)
}

class HomeRecentWatchContainerCell: UITableViewCell {


    static let identifier: String = "HomeRecentWatchContainerCell"
    static let height: CGFloat = 209

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    weak var delegate: HomeRecentWatchContainerCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()

        self.containerView.layer.borderColor = UIColor(named: "stroke-light")?.cgColor
        self.containerView.layer.borderWidth = 1
        self.containerView.layer.cornerRadius = 10

        setCollectionView()
    }

    private func setCollectionView() {

        self.collectionView.delegate = self
        self.collectionView.dataSource = self

        self.collectionView.register(UINib(nibName: HomeRecentWatchItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: HomeRecentWatchItemCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}


extension HomeRecentWatchContainerCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return collectionView.dequeueReusableCell(withReuseIdentifier: HomeRecentWatchItemCell.identifier, for: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        self.delegate?.homeRankingContainerCell(self, didSelectItemAt: indexPath.row)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = HomeRecentWatchItemCell.width
        let height = HomeRecentWatchItemCell.height

        return CGSize(width: width, height: height)
    }
}
