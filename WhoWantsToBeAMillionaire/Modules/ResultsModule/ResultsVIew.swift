//
//  ResultsView.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Ilya on 02.03.2024.
//

import UIKit
import SnapKit

class ResultsView: CustomView {
    
    var dataSource: [User] = []
    
    // Mark: - Views
    let cellSpacingHeight: CGFloat = 10
    
    let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.LogoImage.logo
        return imageView
    }()
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.BackgroundImage.backgroundWithPeople
        return imageView
    }()
    
    let resultTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ResultTableViewCell.self, forCellReuseIdentifier: ResultTableViewCell.reuseIdentifier)
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    let wonLabel: UILabel = {
        let label = UILabel()
        label.text = "You won:"
        let customTextColor = UIColor(named: "custom-white")
        label.textColor = customTextColor
        label.font = UIFont.TextFont.Question.label
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    let totalWonLabel: UILabel = {
        let label = UILabel()
        label.text = "1000"
        let customTextColor = UIColor(named: "custom-white")
        label.textColor = customTextColor
        label.font = UIFont.TextFont.Question.label
        label.textAlignment = .right
        label.numberOfLines = 1
        return label
    }()
    
    
    override func setViews() {
        self.addSubview(backgroundImageView)
        self.addSubview(logoImage)
        self.addSubview(resultTableView)
        self.addSubview(wonLabel)
        self.addSubview(totalWonLabel)
        resultTableView.delegate = self
        resultTableView.dataSource = self
    }
    
    override func layoutViews() {
        
        logoImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(55)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(201)
        }
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        resultTableView.snp.makeConstraints {
            $0.top.equalTo(totalWonLabel.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(45)
            $0.right.equalToSuperview().inset(45)
            $0.bottom.equalToSuperview().offset(45)
        }
        
        totalWonLabel.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(5)
            $0.right.equalToSuperview().inset(50)
            $0.height.equalTo(35)
            $0.width.equalTo(160)
        }
        
        wonLabel.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(5)
            $0.left.equalToSuperview().inset(35)
            $0.height.equalTo(35)
            $0.width.equalTo(160)
        }
        
    }
    
    func setUsersData(_ data: [User]) {
        dataSource = data
        resultTableView.reloadData()
    }
    
}
extension ResultsView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ResultTableViewCell.reuseIdentifier, for: indexPath) as? ResultTableViewCell
        else {
            return UITableViewCell()
        }
        
        let item = dataSource[indexPath.row]
        let name = "\(indexPath.row + 1). \(item.name)"
        let amount = " \(item.amount) RUB"
        cell.setTitles(number: name, score: amount)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 77
    }
    
}
