//
//  HomeViewController.swift
//  KTV
//
//  Created by 정현준 on 6/13/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTableView()
    }


    private func setTableView() {

        self.tableView.separatorStyle = .none
        self.tableView.delegate = self
        self.tableView.dataSource = self

        self.tableView.register(UINib(nibName: HomeHeaderCell.identifier, bundle: nil), forCellReuseIdentifier: HomeHeaderCell.identifier)
        self.tableView.register(UINib(nibName: HomeVideoCell.identifier, bundle: nil), forCellReuseIdentifier: HomeVideoCell.identifier)
        self.tableView.register(UINib(nibName: HomeRankingContainerCell.identifier, bundle: nil), forCellReuseIdentifier: HomeRankingContainerCell.identifier)
        self.tableView.register(UINib(nibName: HomeRecentWatchContainerCell.identifier, bundle: nil), forCellReuseIdentifier: HomeRecentWatchContainerCell.identifier)
        self.tableView.register(UINib(nibName: HomeRecommendContainerCell.identifier, bundle: nil), forCellReuseIdentifier: HomeRecommendContainerCell.identifier)
        self.tableView.register(UINib(nibName: HomeFooterCell.identifier, bundle: nil), forCellReuseIdentifier: HomeFooterCell.identifier)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return HomeSection.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        guard let section = HomeSection(rawValue: section) else {
            return 0
        }

        switch section {
        case .header:
            return 1
        case .video:
            return 2
        case .rank:
            return 1
        case .recent:
            return 1
        case .recommend:
            return 1
        case .footer:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let section = HomeSection(rawValue: indexPath.section) else {
            return UITableViewCell()
        }

        switch section {
        case .header:
            return tableView.dequeueReusableCell(withIdentifier: HomeHeaderCell.identifier, for: indexPath)
        case .video:
            return tableView.dequeueReusableCell(withIdentifier: HomeVideoCell.identifier, for: indexPath)
        case .rank:
            return tableView.dequeueReusableCell(withIdentifier: HomeRankingContainerCell.identifier, for: indexPath)
        case .recent:
            return tableView.dequeueReusableCell(withIdentifier: HomeRecentWatchContainerCell.identifier, for: indexPath)
        case .recommend:
            return tableView.dequeueReusableCell(withIdentifier: HomeRecommendContainerCell.identifier, for: indexPath)
        case .footer:
            return tableView.dequeueReusableCell(withIdentifier: HomeFooterCell.identifier, for: indexPath)
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        guard let section = HomeSection(rawValue: indexPath.section) else {
            return 0
        }

        switch section {
        case .header:
            return HomeHeaderCell.height
        case .video:
            return HomeVideoCell.height
        case .rank:
            return HomeRankingContainerCell.height
        case .recent:
            return HomeRecentWatchContainerCell.height
        case .recommend:
            return HomeRecommendContainerCell.height
        case .footer:
            return HomeFooterCell.height
        }
    }
}
