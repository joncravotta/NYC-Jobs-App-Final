//
//  JobTitleTableViewCell.swift
//  NYC_JOBS_DATA_FINAL
//
//  Created by Jonathan Cravotta on 6/2/18.
//  Copyright © 2018 Jonathan Cravotta. All rights reserved.
//

import Foundation
import UIKit

class JobTitleTableViewCell: UITableViewCell {
    
    private let bubbleView = WorkTimeBubbleView()
    private let titleLabel = UILabel()
    private let bottomBorder = UIView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setUpView() {
        addSubview(bubbleView)
        addSubview(titleLabel)
        addSubview(bottomBorder)
        
        bubbleView.layer.cornerRadius = 12
        
        titleLabel.font = UIFont.systemFont(ofSize: 22.0, weight: .bold)
        titleLabel.numberOfLines = 0
        
        bottomBorder.backgroundColor = .lightGray
        
        bubbleView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.height.equalTo(24)
            make.leading.equalTo(titleLabel)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(bubbleView.snp.bottom).offset(7)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20)
        }
        
        bottomBorder.snp.makeConstraints { make in
            make.width.centerX.equalToSuperview()
            make.height.equalTo(0.5)
            make.bottom.equalToSuperview()
        }
    }
    
    func setUp(withTitle title: String, indicator: WorkTimeIndicator) {
        bubbleView.setUp(with: indicator)
        titleLabel.text = title
    }
}
